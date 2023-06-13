# Launch Screen

어플리케이션이 시작할 때 즉시 나타나고 어플리케이션의 첫 화면으로 빠르게 교체되는 화면<br>
어플리케이션의 반응이 빠르고 반응이 좋다는 인상을 주며, 로딩되는 동안 빈 화면을 보여주지 않기 위해 사용한다. <br>
또한 어플리케이션의 아이덴티티를 나타낼 수 있으며, iOS에서는 launch screen, 안드로이드에서는 splash라고 한다.<br>

### xcode의 launch screen
<img width="202" alt="스크린샷 2023-06-13 오전 11 26 56" src="https://github.com/LURKS02/objectiveCPractice/assets/63408930/3749f576-f0ec-49ff-a57c-a9efe3fdcb84">

xcode에서는 LaunchScreen 스토리보드에서 화면을 구성할 수 있다.<br>

### launch screen 사용 시 주의점
- UIKit 만을 사용해야 한다.
- 단 하나의 UIView / UIViewController 객체만을 사용해야 한다.
- Actions / outlets 과 같은 코드를 연결하면 안된다.
- UIWebView를 사용해서는 안된다. (Deprecated view)
- 사용자 정의 클래스를 사용하면 안된다.
- 런타임 속성을 사용하면 안된다.
즉, launch screen 에서는 최소한의 동작만 이루어져야 한다.

### launch screen 시간 조절하기
어플리케이션 시작에 필요한 데이터 로딩이 끝나면 launch screen은 종료된다.<br>
시간을 늘리기 위해서는 AppDelegate의 application(_:didFinishLaunchingWithOptions:) 를 수정해야 한다.<br>
이 곳에 지연 로직을 넣으면 launch 프로세스가 지연된다.

