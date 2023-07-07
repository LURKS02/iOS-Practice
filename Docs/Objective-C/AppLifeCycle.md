# iOS Application Life Cycle

### UIApplicationMain
어플리케이션 객체와 delegate를 생성하고 event cycle을 설정한다.<br>
모든 iOS 어플리케이션에서는UIApplicationMain을 실행하며, 이때 UIApplication 객체가 생성된다.<br>

<br>

### UIApplication
singleton 형태로 생성되어 UIApplication.shared의 형태로 어플리케이션 전역에서 사용 가능하다.<br>
user의 이벤트(터치, 리모트 컨트롤, 가속도계, 자이로스코프 등)에 반응하여 어플리케이션의 초기 routing(초기 설정)을 한다.<br>
어플리케이션이 Background에 진입한 상태에서 추가적인 작업을 할 수 있도록 만들어주거나, 푸쉬 알람을 받았을 때 처리하는 방식을 다루는 역할을 한다.<br>
어플리케이션 실행 시 Main Run Loop를 실행하고, 이를 View와 관련된 이벤트나 View의 업데이트에 활용한다.<br>

<br>

### 유저 이벤트의 처리 과정
유저가 이벤트를 일으키면 시스템을 통하여 이벤트가 생성되고, 해당 이벤트는 UIkit 프레임워크를 통해 생성된 port를 통해 어플리케이션으로 전달된다.<br>
이벤트는 어플리케이션 내부적으로 Queue의 형태로 정리되며, Main Run Loop에  하나씩 매핑된다.<br>
이때 UIApplication 객체는 가장 먼저 이벤트를 받는 객체로 어떤 것이 실행되어야 하는지 결정한다.<br>

<br>

### Main Run Loop
유저가 일으키는 이벤트들을 처리하는 프로세스로, View와 관련되어 있기 때문에 Main 스레드에서 실행된다.<br>

<br>

### Application State
#### Not Running
아무 것도 실행하지 않은 상태<br
사용자가 어플리케이션을 처음 실행하거나, 어플리케이션 스위처에서 어플리케이션을 완전히 종료한 경우에 해당한다.<br>
#### InActive
어플리케이션이 Foreground 상태로 돌아가지만, 이벤트는 받지 않는 상태<br>
어플리케이션 상태 전환 과정에서 일시적으로 머무는 단계<br>
사용자가 어플리케이션을 닫거나 다른 어플리케이션을 시작하기 전에 머무는 단계<br>
#### Active
일반적으로 어플리케이션이 돌아가는 상태<br>
사용자가 인터페이스와 상호작용이 가능한 단계<br>
#### Background
어플리케이션이 Suspended(유예) 상태로 진입하기 전 거치는 상태<br>
사용자가 홈버튼을 누르거나 다른 어플리케이션을 실행하면 일시적으로 이동하며, 새로운 데이터를 다운로드하거나 재생 중인 오디오를 계속 재생하는 등의 작업이 가능하다.<br>
일부 필요한 추가 작업을 수행할 수 있으며, 이 상태에서 어플리케이션을 실행하면 InActive 상태를 거치지 않고 어플리케이션이 실행된다.<br>
Background 상태에서 Suspended 상태로 진입할 때 willTerminate 메서드가 실행되지만, 기기를 재부팅하면 실행되지 않는다.<br>
#### Suspended
어플리케이션이 Background 상태에 있지만 아무 코드도 실행하지 않는 상태<br>
시스템이 임의로 Background 상태의 어플리케이션을 Suspended 상태로 만들고, 메모리에서 제거하며, 상태는 Not Running으로 변경된다.<br>
어플리케이션이 Suspended 상태에서 Not Running 상태로 진입하는 것은 알림을 받을 수 없다.<br>

<br>

### AppDelegate
어플리케이션 State에 접근하기 위해 사용되는 파일<br>
어플리케이션과 시스템의 연결을 위해 필요한 delegate 메서드를 가지고 있다.<br>
UIResponder(어플리케이션에서 발생하는 이벤트들을 담고 있는 추상형 인터페이스 객체), UIApplicationDelegate(UIApplication 객체의 작업에 접근할 수 있는 메서드 포함)를 상속 및 참조한다.<br>
didFinishLaunchingWithOptions, applicationWillResignActive 등의 메서드를 통해 어플리케이션 상태가 변할 떄 수행할 작업들을 설정할 수 있다.<br>

