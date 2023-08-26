# Application Life Cycle

## iOS 12 이전

iOS 12 까지는 하나의 앱에 하나의 window가 존재하며, 앱 단위로 상태 변화를 관리하였다.

하나의 앱이 하나의 user interface 객체와만 매칭 되었다.

![R1280x0-2](https://github.com/LURKS02/iOS-Practice/assets/63408930/6e65d43d-da26-47c1-a699-230c072ab6c5)

- **Not Running** : 실행되지 않거나 종료된 상태
- **InActive** : 어플리케이션이 Foreground 상태로 돌아가지만 이벤트는 받지 않는 상태, 어플리케이션의 상태 전환 과정에서 잠깐 머무는 단계
- **Active** : 앱이 foreground에서 실행중이며 이벤트를 받고있는 일반적인 동작 상태
- **Background** : 앱이 Suspended로 진입하기 전 거치는 상태, 보통 다른 앱들은 바로 Suspended로 넘어가며, 음악 / 통화 앱의 경우 background에 머무른다. background로 들어가면 앱이 종료되었다고 볼 수 있다.
- **Suspended** : 앱이 background에 존재하며 아무 코드도 실행하지 않는 상태로, 시스템이 임의로 Background 상태의 앱을 Suspended 상태로 만든다. 메모리가 부족한 상황이 오면 iOS system이 여유 메모리 공간 확보를 위하여여 이 상태의 앱들을 특별한 알림없이 정리할 수 있다.

**AppDelegate**로 상태 간 전환 시 수행할 동작을 담을 수 있었다.

AppDelegate는 UIResponder, UIApplicationDelegate를 상속 및 참조한다.

- UIResponder : 앱에서 발생하는 이벤트를 담는 추상형 인터페이스 객체로, View와 사용자 이벤트 간 연결을 관리한다.
- UIApplicationDelegate : UIApplication 객체의 작업에 개발자가 접근할 수 있도록 하는 메소드들을 담고 있다.

다음과 같은 메소드들을 사용하여 App의 상태 전환에 따른 동작을 정의할 수 있었다.

```jsx
application(_:willFinishLaunchingWithOptions:)
// App이 최초 실행될 때 호출
// Not Running -> Foreground 로 전환

application(_:didFinishLaunchingWithOptions:)
// App이 실행 직후 화면이 사용자에게 보여지기 직전에 호출

applicationDidBecomeActive(_:)
// App이 Active 상태로 전환되어 화면이 나타난 후 호출
// InActive로 넘어가면서 중지된 작업이 있다면 여기서 재실행

applicationWillResignActive(_:)
// App이 InActive 상태로 전환되기 직전에 호출

applicationDidEnterBackground(_:)
// App이 Background 상태로 전환된 직후 호출
// Background에서 Suspended로 전환될 수 있으며, 중요한 데이터를 저장하거나 공유 자원을 해제하는 등의 작업 수행
// App이 재실행될 경우 직전 상태를 복구하기 위한 정보를 저장하는 작업 필요

applicationWillEnterForeground(_:)
// App이 Background에서 Foreground로 돌아오기 직전에 호출
// 호출된 뒤 InActive를 거쳐 Active로 진입

applicationWillTerminate(_:)
// App이 종료되기 직전에 호출
// 호출되지 않는 경우 : 메모리 확보를 위해 Suspended인 App을 종료시킬 경우 / 사용자가 multitasking UI를 통해 종료할 경우 / 오류로 인해 App이 종료될 경우 / Device를 재부팅할 경우
```

## iOS 13 이후

### Scene

멀티플 윈도우를 지원하기 위하여 도입된 개념으로, **하나의 앱에서 여러 화면을 띄우기 위해** 존재한다.

scene은 하나의 UI 인스턴스로, windows와 view controllers를 포함하며, 각 scene은 UIWindowSceneDelegate 객체에 상응하는 것을 가지고 UIKit 및 앱과 상호작용한다.

scene은 동시에 실행될 수 있으며, 같은 메모리와 앱 프로세스 공간을 공유한다.

![R1280x0-3](https://github.com/LURKS02/iOS-Practice/assets/63408930/20157f19-7c3e-4d94-b0a6-8d381178b9f6)

### Scene Delegate

iOS13부터 Scene이라는 개념이 도입되어 하나의 앱이 여러 개의 Scene을 가질 수 있게 되었다.

하나의 process를 사용하긴 하지만, 다수의 UI 객체나 scene session을 가지게 되었다.

scene이 등장하고, appDelegate에서 **UISceneSession** 을 관리할 수 있게 되었고, scene을 생성하고 관리하는 역할을 맡게 되었다.

iOS 13 부터는 AppDelegate는 Process Lifecycle 역할은 그대로 유지하지만,

UI와 관련된 작업들에 대한 UI Lifecycle 핸들링 역할은 **SceneDelegate** 가 담당하게 되었다.

즉, 다음과 같은 변동이 발생하였다.

```jsx
// UIApplicationDelegate 에서 제거
application:willEnterForeground
application:didEnterBackground
application:willResignActive
application:didBecomeActive

// UISceneDelegate 에서 추가
scene:willEnterForeground
scene:didEnterBackground
scene:willResignActive
scene:didBecomeActive
```
![R1280x0-4](https://github.com/LURKS02/iOS-Practice/assets/63408930/d625b750-8688-4165-bc87-8ce4bda551a1)

![R1280x0-5](https://github.com/LURKS02/iOS-Practice/assets/63408930/ce80f2df-7231-4bec-aad3-bff3ac72da5e)

### Scene-Based Life cycle

각 Scene마다 life cycle이 존재하며, 다음과 같은 상태를 가진다.

![R1280x0-6](https://github.com/LURKS02/iOS-Practice/assets/63408930/f014bea5-d807-4b60-ac21-7c02a5bffbb7)

- **Unattached** : 사용자 혹은 시스템이 앱에 새로운 scene을 요청하면 UIKit이 이를 생성하고 Unattached 상태로 설정
- **Foreground** : Scene이 현재 화면을 점유하고 있고, 시스템 리소스에 대한 우선 순위를 가지는 상태
    - **Active** : 이벤트를 받을 수 있는, 일반적으로 앱이 돌아가고 있는 상태
    - **InActive** : 이벤트를 받고 있지 않은 상태, Scene이 다른 상태에서 Active로 전환되거나, Active에서 다른 상태로 전환되는 동안 InActive 상태를 거쳐간다. 외부적인 Interrupt에 의해 InActive 상태가 될 수 있다.
- **Background** : Scene이 화면을 점유하고 있지 않고, Background에서 동작되는 상태. 가능한 최소한의 동작을 수행한다. (ex. 네트워크, 타이머, 음악 재생 등)
- **Suspended** : 앱이 Background에 있으며 아무 동작도 실행하지 않는 상태. 시스템이 임의로 Background 상태의 앱을 Suspended로 만들 수 있다.

사용자 또는 시스템이 앱에 새로운 Scene을 요청하면 UIKit이 이를 생성하고 Unattached 상태로 둔다.

사용자가 요청한 Scene은 Foreground로 이동해 화면에 표시되며, 시스템이 요청한 Scene은 이벤트를 처리할 수 있도록 일반적으로 Background로 이동한다.

사용자가 앱의 UI를 닫으면 UIKit은 연결된 Scene을 Background로 이동시키고 나중에는 Suspended로 변경한다.

UIKit은 리소스 회수를 위하여 Suspended 또는 Background 상태의 Scene과의 연결을 끊고 해당 Scene을 Unattached 상태로 변경할 수 있다.

### UIWindowScene

앱의 Scene 인스턴스 하나를 관리하는 타입으로, 해당 인스턴스의 UI를 표현하기 위해 window를 가지고 있다.

scene의 상태가 변하면 UIWindowSceneDelegate 프로토콜을 채택하는 delegate 객체를 notify한다.

다음과 같은 메소드들을 사용하여 scene의 생명주기에 따른 작업을 수행할 수 있다.

```jsx
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
// UISceneSession 에서 호출되는 첫 번째 메소드
// 새 UIWindow를 만들고 루트 뷰 컨트롤러 설정

func sceneWillEnterForeground(_ scene: UIScene)
// Scene이 Background -> Foreground로 진입할 때 호출
// Background에 진입하며 생긴 변화들을 취소할 수 있음

func sceneDidBecomeActive(_ scene: UIScene)
// Scene이 InActive -> Active로 전환될 때 호출
// InActive 상태에서 정지된 작업을 다시 시작할 수 있음
// Scene과의 상호작용이 시작되며 Active 상태로 전환되면 사용자 이벤트를 받을 수 있게 됨

func sceneWillResignActive(_ scene: UIScene)
// Scene이 Active -> InActive로 전환될 때 호출
// 외부 interrupt에 의해 호출될 수 있으며, 사용자가 Scene과의 상호작용을 중지할 때 호출

func sceneDidEnterBackground(_ scene: UIScene)
// Scene이 Foreground -> Background로 진입할 때 호출
// 데이터 저장, 공유 리소스 해제, Scene별 상태 정보 저장

func sceneDidDisconnect(_ scene: UIScene)
// Scene이 시스템에 의해 종료되었을 때 호출 (세션에서 연결 해제되고 비활성화)
// 다음에 Scene이 연결될 때 다시 생성될 수 있는 모든 리소스 해제
```

### 어플리케이션 실행 시 메소드 호출 순서

1. [AppDelegate] didFinishLaunchingWithOptions
2. [AppDelegate] configurationForSession
3. [SceneDelegate] willConnectToSession
4. [SceneDelegate] scene(_:willConnectTo)
    
    → window = UIWindow(windowScene: scene as! UIWindowScene)
    
    → 화면에 앱이 등장하는 시점
    
5. [SceneDelegate] sceneWillEnterForeground
6. [SceneDelegate] sceneDidBecomeActive
    
    ↔
    
7. [SceneDelegate] willResignActive
8. [SceneDelegate] didEnterBackground
9. [SceneDelegate] didDisconnect
    
    (앱 화면 명시적 종료시)
    
10. [AppDelegate] didDiscardSceneSessions
