# Responder Chain

## Responder

이벤트를 핸들링하고 이벤트에 반응할 수 있는 객체

이벤트 핸들링을 위한 인터페이스와 responder들의 기본적인 행위를 정의한다.

모든 responder 객체는 UIResponder에서 상속된 클래스들의 인스턴스로, UIApplication, UIViewController, UIView 등의 객체들이 모두 responder이다.

![uiresponder](https://github.com/LURKS02/iOS-Practice/assets/63408930/6104f535-91bd-4682-a451-2e2d897229b5)

이벤트가 발생하면 UIKit은 이벤트 핸들링을 위해 해당 이벤트를 어플리케이션의 responder 객체들에게 보낸다.

이벤트 핸들링을 위해서는 responder가 해당 이벤트에 대응하는 메서드들을 구현하고 있어야 한다.

<br>

## 터치 이벤트

1. 터치가 발생하면, UIKit은 UITouch 객체를 생성한다.
2. UITouch 이벤트는 어플리케이션의 이벤트 큐에 추가된다.
3. UIApplication 객체가 이벤트 큐에서 이벤트를 가져와 현재 활성화된 UIWindow의 sendEvent: 메서드에 전달한다.
4. UIWindow는 해당 이벤트를 받아 적절한 UIView 객체로 전달한다. 이때 hitTest:withEvent: 메서드를 사용하여 어떤 뷰가 터치되었는지 결정한다.
5. 터치된 UIView는 UIResponder의 서브 클래스로, 해당 뷰가 터치 이벤트를 처리하지 않는다면, 이벤트는 UIResponder 체인을 따라서 부모 뷰 또는 다른 UIResponder 객체로 전달된다. 이때 Responder Chain은 뷰의 계층 구조를 따르며, 최종적으로 UIViewController / UIWindow / UIApplication / app delegate 까지도 도달이 가능하다.
6. 터치된 뷰 또는 그 이후의 UIResponder 체인의 어느 지점에서라도 해당 이벤트를 처리할 수 있는 메서드가 호출되면, 해당 지점에서 이벤트 처리가 이루어진다.

<br>

## Responder Chain

responder 객체들이 이벤트 또는 액션 메시지를 핸들링할 책임을 다른 객체들에게 전송할 수 있도록 한다.

특정 responder가 이벤트를 핸들링하지 않을 경우, 해당 이벤트를 responder chain의 다음 객체에게 forwarding 한다.

메시지는 처리될 때까지 계속해서 chain의 상위 객체로 이동한다.

![ios-responder-chain-example](https://github.com/LURKS02/iOS-Practice/assets/63408930/502e50f7-1c7d-4456-9e80-b1c07068ffef)

일반적으로 이벤트는 뷰(first responder 또는 터치된 뷰)에서 시작하여, 뷰 계층을 따라 window 객체를 거쳐 app 객체에 도달할 때까지 이동한다. 

뷰는 뷰의 슈퍼뷰에게, 뷰 계층의 루트 뷰는 루트 뷰의 뷰 컨트롤러에게 포워딩하는 등 responder chain의 일정한 규칙이 존재한다.

이때 responder 객체의 next 프로퍼티를 오버라이드하여 responder chain을 변경하는 것이 가능하다.

<br>

| 종류 | next |
| --- | --- |
| UIView | 해당 뷰가 뷰 컨트롤러의 루트 뷰라면 next responder는 뷰 컨트롤러가 된다. 아닌 경우, next responder는 해당 뷰의 슈퍼 뷰이다. |
| UIViewController | 뷰 컨트롤러의 뷰가 윈도우의 루트 뷰라면, next responder는 window 객체이다. 만약 뷰 컨트롤러가 다른 뷰 컨트롤러에 의해 present 된 경우, next responder는 presenting 뷰 컨트롤러이다. |
| UIWindow | window의 next responder는 UIApplication 객체이다. |
| UIApplication | UIApplication 객체의 next responder는 app delegate이다. app delegate가 UIResponder의 인스턴스이면서 뷰, 뷰 컨트롤러, 앱 객체 자신이 아닌 경우에만 해당된다. |

<br>

## Hit-Testing

UIKit은 터치 위치를 뷰 계층에 있는 뷰 객체의 바운드와 비교하여, UIView의 hitTest(_:with:) 메서드를 통해 특정 터치를 포함하는 가장 깊은 서브뷰를 찾기 위해 뷰 계층을 따라서 이동한다.

이때 가장 깊은 서브뷰가 터치 이벤트의 first responder가 된다.
