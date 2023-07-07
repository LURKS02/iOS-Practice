# High Performance Autolayout

## AutoLayout Engine

설정된 여러 개의 일차 방정식을 계산하는 코어 모듈<br>
뷰의 제약 조건을 기반으로 뷰 계층의 레이아웃을 계산하고 조정한다.<br>

### 동작 과정
1. View에서 Constraints (뷰의 위치, 크기, 다른 뷰와의 상대적인 위치 관계 등) 를 추가한다. 이를 방정식으로 변환하여 Engine쪽으로 전달한다.<br>
2. Engine이 전달받은 방정식을 계산한다. 이 과정에서 제약 조건 충돌이 확인되면, 우선순위, 암시적 제약 조건, 뷰의 Compressible과 Hugging 우선순위 등을 고려하여 충돌을 위한 추가적인 처리를 진행한다.<br>
3. 계산 결과 값을 Variable(minX, minY, width, height 등)로 View에게 전달한다. 이때 각각의 Variable 값이 변경되었다는 것을 View에게 알린다.<br>
4. Variable 변경 이벤트를 받은 View는 setNeedsLayout()을 호출한다.<br>
5. 해당 View의 layoutSubViews()가 호출되며, View는 Engine의 데이터를 Frame으로 복사하고 자신과 자신의 SubView의 Layout을 결정한다.<br>

<br>

### Auto Layout의 성능 향상

#### 1. 관계가 없는 View 사이에 Constraints를 설정하지 않는다.<br>
Engine은 서로 관계가 없는 View의 Constraints를 별개로 인지하므로, View끼리 Constraints가 걸려있지 않을 때 Constraints 계산 비용은 선형적으로 증가한다.<br>
즉, 여러 개의 View에 독립적으로 걸려 있는 Constraints를 하나의 View로 묶어서 처리하는 방식은 Constraints 계산 비용을 증가시킬 수 있다.<br>

#### 2. 자연스러운 Constraint 사용<br>
억지로 Constraint를 적게 사용하려고 하면, 예를 들어 Constraint 최적화를 위해 Constraint를 반복적으로 추가/제거 하는 등의 작업은 오히려 비용을 증가시킬 수 있어, Constraint를 직관적으로 필요한 만큼 추가하는 것이 좋을 수 있다.<br>
두 개의 Layout을 하나의 View로 표현하기 위해서는 복잡한 Constraint를 설정하는 경우가 있는데, 직관적으로 View가 Constraint를 통해 명확하게 표현될 수 있는가에 중점을 두고 설정하는 것이 옳다.<br>


#### 3. Priority 설정과 성능<br>
View가 Engine에게 계산된 Variable을 요청할 때, Engine은 전달받은 Constraint의 에러 여부를 확인하고, 에러가 존재한다면 View에게 에러를 최소화(Minimize)해줄 것을 요청한다.<br>
이때 에러를 최소화하는 과정에서 Simplex Algorithm을 사용하여 에러를 최소화하는 최적해(Variable)를 도출한다.<br>
AutoLayout은 Required Priority(1000)으로 설정된 Constraint를 제외하고 무시 가능한 Optional Constraint로 취급하며, 다른 Constraint를 모두 계산하고 난 후 Layout의 모호함이 남아있을 때 Optional Constraint를 사용하여 적절한 Constraint를 결정한다.<br>
이러한 Variable 도출 과정은 일반적으로 비용이 크지 않아 AutoLayout의 성능에 큰 영향을 미치지는 않는다.<br>

#### 4. Constraint Churn
Constraint Churn 은 시각적으로 동일한 Layout 결과물에 대하여 불필요하게 복잡한 Constraint를 설정하거나, 반복적으로 Constraint를 추가/제거하여 뒤섞는 것을 말한다.<br>
실제 Layout 변경은 없지만 Engine이 더 많은 일을 하도록 하여 AutoLayout의 성능에 악영향을 끼친다.<br>
Constraint Churn은 다음과 같은 경우에 주로 발생한다.<br>
- 모든 Constraint 제거 후 다시 설정
- 변경이 필요하지 않은 Constraint 변경
- 반복적인 Constraint의 추가 및 제거
따라서 다음과 같은 방식으로 AutoLayout을 처리하면 Constraint Churn을 줄이는 것이 가능하다.<br>
- 모든 Constraint를 제거하지는 않는다.
- 동적으로 추가될 필요가 없는 Constraint는 init과정 등에서 정적으로 한 번만 추가한다.
- 변경이 필요한 Constraint만 변경한다.
- Add/Remove (Activate / Deactivate) 를 하는 것 보다는 View를 Hidden 처리한다.<br>

<br>

### Constraint Churn과 Render Loop

Render Loop는 View의 Layout 변경이 필요할 때, 예를 들어 View의 bounds가 변경되거나, 회전 이벤트가 발생하거나, setNeedsLayout(), layoutIfNeeded()가 호출될 때 수행된다.<br>
이러한 Render Loop는 다음과 같은 진행 흐름을 가진다.<br>
1. updateConstraints() 호출 - View Hierarchy의 leaf -> Window 방향으로 호출
2. layoutSubVIews() 호출 - Window -> SubViews 방향으로 호출
3. draw(rect:) 호출 - Window -> SubViews 방향으로 호출<br>

updateConstraints()를 오버라이딩하여 Constraint 업데이트 수행 시, 별도의 예외처리 없이 Constraint 추가/제거 작업을 반복적으로 수행할 경우 Layout 성능에 이슈가 발생할 수 있다.<br>
따라서 Constraint 업데이트는 최초 설정, 이벤트 발생 시 업데이트 등 필요한 경우에만 수행하는 것이 좋으며, updateConstraints(), layoutSubViews() 는 해당 메서드를 오버라이딩하여 Constraint를 처리하지 않으면 Layout이 제대로 잡히지 않는 경우에만 사용하는 것이 성능에 도움이 된다.<br>
