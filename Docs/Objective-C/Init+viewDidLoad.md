# init과 viewDidLoad

#### init

ViewController를 초기화하기 위해 사용되는 메서드로, UIViewController 만을 초기화하며 View를 초기화시키지는 않는다.<br>
Data와 관련된 기본적인 초기화가 진행된다.<br>
이 시점에서 대부분의 UI 컴포넌트들이 활성화되지 않은 상태이므로, UI 컴포넌트를 요구하지 않는 변수 등을 초기화하기에 적합하다.<br>

#### viewDidLoad

View를 로드하기 위해서 사용되는 메서드로, nib이 로드된 후에 호출된다.<br>
View가 이 시점에 생성되고 SubView를 더할 수 있게 되므로, View에 관련된 기본적인 초기화가 진행된다.<br>

<br>
스토리보드를 사용하게 되면 init 영역을 건드리는 일이 많이 없다.
