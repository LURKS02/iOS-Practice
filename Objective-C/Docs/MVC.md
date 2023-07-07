# MVC 패턴

애플리케이션의 구성 요소를 모델(Model), 뷰(View), 컨트롤러(Controller)로 분류한 디자인 패턴<br>

### - Model<br>
응용 프로그램의 데이터를 캡슐화하며 해당 데이터들을 조작하고 처리하는 로직 및 연산을 정의한다.<br>
응용 프로그램의 영구적 상태에 속하는 대부분의 데이터들은 모델 객체에 존재해야 한다.<br>
다른 모델 객체와 일대일 / 일대다 관계를 가질 수 있으며, 응용프로그램의 모델 레이어는 하나 이상의 객체 그래프로 이루어질 수 있다.<br>
사용자 인터페이스 / 표시 로직과는 독립적인 로직 및 데이터를 포함한다.<br>
(Ex. 사용자 프로필 정보, 네트워크로부터 가져온 데이터 등)<br>

##### 통신 방식
```swift
모델 객체는 뷰 객체와 명시적으로 연결되어 있어서는 안된다.
뷰 레이어에서 데이터를 생성하거나 변경시키는 사용자 행동은 컨트롤러를 통해 모델 객체의 생성 또는 업데이트를 일으키게 된다.
모델 객체가 변경되면 그것은 컨트롤러 객체에 알려지고 컨트롤러 객체는 적절한 뷰 객체를 업데이트한다.
```

### - View<br>
응용 프로그램에서 사용자들이 볼 수 있는 부분의 객체를 의미한다.<br>
사용자 인터페이스와 직접적인 관련이 있는, 사용자에게 보여지는 요소<br>
사용자와의 상호작용을 처리하고 그에 따라 화면을 업데이트한다.<br>
뷰 객체의 주요 목적은 모델 객체의 데이터를 보여주고 이 데이터들을 편집할 수 있도록 하는 것이다.<br>
(Ex. 버튼, 레이블, 테이블 등)<br>

##### 통신 방식
```swift
뷰 객체는 모델 객체의 변화를 컨트롤러를 통해 알게 된다.
사용자에 의해 시작된 변화(텍스트 필드에 텍스트를 넣는 등)는 컨트롤러 객체를 통해 모델 객체에 전달된다.
```

### - Controller<br>
하나 이상의 뷰 객체와 하나 이상의 모델 객체 간 중개자 역할<br>
뷰 객체와 모델 객체가 서로의 변화를 알게 되는 통로이다.<br>
Controller는 사용자의 입력을 처리하고, Model을 업데이트하며, View를 통해 사용자에게 결과를 표시한다.<br>
View로부터 사용자의 action을 받아 Model에게 어떤 작업을 해야 하는지 알려주거나, Model의 데이터 변화를 View에게 전달하여 View를 어떻게 업데이트 할지 알려준다.<br>
응용 프로그램의 설정 및 조정 작업을 수행하며 다른 객체들(View 및 Model)의 수명주기(Life Cycle)를 관리하는 역할을 한다.<br>

##### 통신 방식
```swift
컨트롤러 객체는 뷰 객체에서의 사용자 행동을 해석하여 데이터의 생성이나 변경에 대한 것을 모델 레이어에 알린다.
모델 객체에서 변경이 발생하면 컨트롤러 객체는 새로운 모델 데이터를 뷰 객체에 알린다.
```
<br>

### MVC 패턴의 대화 방식
Controller는 Model / View에 직접 지시를 할 수 있지만, Model / View 는 Controller에게 일방적으로 알릴 수 없다.<br>

#### View to Controller
Controller는 View에서 발생할 수 있는 action에 대한 target을 만들어두고, View에서 유저의 action이 발생할 경우 Controller에 있는 target이 이를 받아들이고 작업을 수행한다.<br>
View는 delegate 패턴의 delegate / datasource를 이용하여 Controller에게 어떤 작업을 수행해야 하는지 알리기도 한다. (Ex. UITableView의 UITableViewDelegate / UITableViewDatasource)<br>

#### Model to Controller
Model은 Observer 패턴의 Notification과 KVO를 통해 Controller에게 알린다.<br>
Notification / KVO는 일을 수행하는 객체(publisher)가 진행하던 작업이 끝나면 자신들을 구독 중인 객체(subscribers)에게 신호를 보내는 방식이다.<br>
즉, 작업이 완료되면 Controller에게 신호를 보낸다.<br>

<br>

### MVC 패턴의 장/단점

- 장점
1. Separation of Concerns(SoC)<br>
모델(Model), 뷰(View), 컨트롤러(Controller) 3가지 구성 요소로 분리함으로써 각각의 책임을 분리한다.<br>
코드의 모듈성 및 유지보수성을 높이고, 테스트와 디버깅을 용이하게 한다.<br>

2. 재사용성 및 확장성<br>
개발자들이 각 구성 요소를 독립적으로 개발하고 재사용할 수 있으며, 애플리케이션의 확장성을 향상시킨다.<br>
Ex. View를 Model/Controller와 독립적으로 개발하고 재사용할 수 있다.<br>

3. 병렬 개발
MVC패턴의 SoC는 여러 팀이 동시에 각 구성 요소를 개발할 수 있도록 한다.<br>
Ex. 하나의 팀이 View를 개발하는 동안 다른 팀은 Model을 개발할 수 있다.<br>

<br>

- 단점
1. 코드의 복잡성
각 구성 요소가 다른 요소와 통신하기 위해 상호작용하기 때문에 의존성을 관리해야 하므로 애플리케이션의 복잡성이 높아진다.<br>
2. 컨트롤러의 비대화
Controller가 Model과 View사이의 연결고리 역할을 하면서, Massive View Controller 문제가 발생한다.
3. 프레임워크 의존성
특정 프레임워크에 대한 의존성을 만들어 애플리케이션이 특정한 프레임워크의 구현에 의존하게 되면 이전이 어려워질 수 있다.<br>

<br>

### Apple MVC의 한계
화면과 데이터의 구성이 복잡해질 때, Controller에 다수의 Model과 View가 연결되는 상황이 올 수 있다.<br>
Controller는 View에서 들어오는 사용자 입력을 처리하고, Model의 데이터 업데이트를 알아차린 뒤 View에 넘기는 작업을 모두 수행한다.<br>
이때 Controller에 연결된 View와 Model들이 많아지면 해당 작업들에 대한 코드도 증가하고, Controller가 비대해진다.<br>

### Massive View Controller
View Controller가 너무 많은 책임을 가지게 되어, 코드가 복잡하고 관리하기 어려워진 경우를 의미한다.<br>
MVC패턴에서 Controller의 역할은 Model - View 사이를 중개하는 것이지만, 실제 iOS 어플리케이션에서는 View Controller가 다양한 책임을 맡게 된다.<br>
(Ex. 네트워크 요청, 데이터 변환, 사용자 입력 처리 등)<br>
따라서 코드의 복잡성이 증가하고 View Controller가 과도하게 크고 복잡해지게 되며, 유지보수가 어렵고 버그가 유발될 가능성이 증가한다.<br>

1. Apple의 MVC는 View와 Controller가 너무 밀접하다.
View와 Controller가 굉장히 밀집하게 연결되어 ViewController가 Controller의 역할 뿐 아니라 View의 life cycle에도 관여한다.<br>
따라서 Model은 분리하여 테스트할 수 있어도 View와 Controller는 너무 강하게 연결되어 테스트가 어려워진다.<br>
2. View, Model에 맞지 않는 모든 비즈니스 로직이 Controller에 들어간다.
Model이나 View에 넣기 애매한 코드들은 모두 Controller에 들어가게 되는데, 이에 따라 Controller가 비대해진다.<br>
(Ex. 서버에서 받아온 데이터를 가공(포매팅)하여 뷰에 넘겨주는 로직, 사용자로부터 들어온 interaction을 처리하여 Model / View에 넘기는 로직 등)



