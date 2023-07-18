# UIApplication

iOS에서 실행되는 어플리케이션의 중앙 집중 제어 및 조정 지점<br>
모든 iOS 앱은 단 하나의 UIApplication 인스턴스를 가진다.<br>
어플리케이션이 실행되면 시스템은 UIApplicationMain( : : : :)을 호출하며, 이때 UIApplication 오브젝트가 만들어진다.<br>
이는 싱글톤으로 만들어지며, shared 속성으로 접근할 수 있다.<br>

```swift
UIKIT_EXTERN int UIApplicationMain(int argc, char * _Nonnull * _Null_unspecified argv, NSString * _Nullable principalClassName, NSString * _Nullable delegateClassName);
```
- argc : argv의 개수, 대개 main에 해당하는 파라미터
- argv : argument의 변수 목록, 대개 main에 해당하는 파라미터
- principalClassName : UIApplication 클래스 또는 하위 클래스의 이름으로, nil을 지정하면 UIApplication으로 가정된다.<br>
- delegateClassName : Application delegate가 인스턴스화 되는 클래스 이름 

<br>

### 흐름
AppDelegate.Swift에서 @UIApplicationMain을 통해 UIApplicationMain(_:_:_:_:)을 호출함에 따라 delegateClassName에 “AppDelegate”라는 이름이 전달된다.<br>
그리고 AppDelegate 클래스의 인스턴스를 만들고, 이 인스턴스를 application 객체에 할당한다.<br>
즉 appDelegate와 application 객체가 연결된 것이며, application 객체가 delegate 메소드인 application: didFinishLaunchingWithOptions: 를 호출한다.<br>
이때 AppDelegate가 UIApplicationDelegate를 채택 및 준수하고 있으므로, application: didFinishLaunchingWithOptions: 가 호출되며 어플리케이션이 실행된다.<br>
AppDelegate의 인스턴스는 앱의 콘텐츠가 그려질 window를 만드는 역할을 하기 떄문에, 어플리케이션을 시작하면 흰 화면이 표시된다.<br>

<br>

### 역할
사용자 이벤트의 초기 라우팅(전달받은 사용자 이벤트를 어떤 오브젝트에 전달할지 결정하는 작업)을 처리한다.<br>
UIControl 인스턴스가 전달한 action message를 적절한 target object에 전달한다.<br>
Open 상태의 UIWindow 오브젝트 리스트를 유지하면서, 어플리케이션 내 UIView 오브젝트들을 검색하는데 사용된다.<br>
delegate를 정의하며 (UIApplicationDelegate 프로토콜 채택) 이 delegate에게 중요한 런타임 이벤트가 발생할 때 알려준다. (App launch, low-memory warnings, App termination 등)<br>
