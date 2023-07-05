# Auto Layout

제약 조건(Constraints)에 따라 뷰 계층 구조에 있는 모든 뷰의 크기와 위치를 동적으로 지정하는 것<br>
뷰의 위치나 크기를 다른 객체(Safe Area)를 이용하여 상대적으로 제약을 주는 것<br>
Constraints를 통하여 Width / Height 가 동적으로 지정된다.<br>
* UILabel은 Intrinsic Content Size를 가진다.

## 특징

#### 장점
1. 다양한 화면 크기에 대응 가능한 동적인 UI를 만들 수 있다.<br>
2. 사용자의 변경 사항에 자동으로 조정이 가능하다.<br>

#### 단점
1. 제약 조건의 충돌이 발생하였을 떄 디버깅이 복잡하고 해결하기 어려울 수 있다. <br>
2. 프레임 계산보다 더 많은 계산을 요구하므로 성능에 영향을 미칠 수 있다.<br>

<br>

## Safe Area

<img width="679" alt="스크린샷 2023-06-13 오후 2 24 50" src="https://github.com/LURKS02/objectiveCPractice/assets/63408930/b2b8eb3d-eae6-4d59-b824-052ab3f1eef2">

기존에 쓰이던 Top/Bottom Layout Guide가 Deprecate되고 등장<br>
Top, Bottom, Leading, Trailing에 대한 시스템 마진을 모두 가진다.<br>
시스템에 의하여 가려질 수 있는 부분의 마진을 자체적으로 가지는 것을 말한다.<br>

#### 특정 Constraint만 Safe Area를 적용하지 않는 방법
<img width="250" alt="스크린샷 2023-06-13 오후 2 34 50" src="https://github.com/LURKS02/objectiveCPractice/assets/63408930/ba9d88d8-4d1d-4ed4-8d73-62f6e164b1d5">

Constraint의 기준 뷰를 Superview로 설정한다.

<br>

<img width="334" alt="스크린샷 2023-06-13 오후 2 33 55" src="https://github.com/LURKS02/objectiveCPractice/assets/63408930/2631a2d2-8b75-441a-9ae3-f8114dc0863b">


<br>

## Intrinsic Content Size
컨텐츠의 본질적인 크기를 의미한다.<br>
Ex) Label의 경우 들어가는 텍스트의 길이, 폰트에 따라 본질적인 width / height를 자체적으로 갖기 때문에 Label에 대해 width / height를 지정해주지 않아도 된다.<br>

#### Hugging Priority
오토레이아웃 시스템에서 뷰가 자신의 컨텐츠에 얼마나 강하게 압축되는지를 나타내는 우선순위<br>
뷰가 작아지고 컨텐츠를 압축하는 데 영향을 준다.<br>
만약 두 개 이상의 뷰가 부모 컨테이너에 존재하고, 충돌하는 제약 조건이 있을 경우, 압축 우선순위가 높은 뷰는 압축이 많이 되고 압축 우선순위가 낮은 뷰는 압축이 덜 된다.<br>

#### Compression Resistance Priority
오토레이아웃 시스템에서 뷰가 자신의 컨텐츠에 얼마나 강하게 압축 저항 하는지를 나타내는 우선순위<br>
뷰가 컨텐츠를 보호하고 더 많은 공간을 차지하는 데 영향을 준다.<br>
압축 저항 우선순위가 높은 텍스트 뷰는 컨텐츠가 길어져도 크기를 유지하려고 하고, 압축 저항 우선순위가 낮은 뷰는 컨텐츠를 축소하여 크기를 조절할 가능성이 높다.<br>

