# SceneDelegate

iOS13부터 iPad에서 multi window를 지원하게 되면서 scene delegate가 추가되었다.<br>
본래 AppDelegate는 앱의 프로세스 수준을 알리는 역할(시스템이 앱을 실행하거나 종료할 때 App Delegate에게 알림)과 앱이 현재 UI State를 알 수 있도록 하는 역할을 가지고 있었다.<br>
iOS12까지는 하나의 앱이 하나의 프로세스와 하나의 UI만 사용했기 때문에 이러한 App Delegate구조가 유효했다.<br>
하지만 iOS13부터 앱들이 하나의 공유 프로세스를 사용하지만 여러 개의 UI, scene session을 가질 수 있게 되면서 App Delegate는 실행 이벤트같은 LifeCycle에는 책임이 있지만 UILifeCycle에는 책임을 잃게 된다.<br>
따라서 App Delegate에서 수행하던 UI 관련 작업들을 Scene Delegate로 이전해야 한다.<br>
App Delegate는 또한 Session Lifecycle에 대한 책임을 가지며, 새로운 scene session이 생성되거나 기존 scene session이 삭제될 때 App Delegate에게 알려야 한다.<br>

<br>

### 사용
iOS13에서 앱이 새로운 Scene LifeCycle을 채택하면 UIKit은 App Delegate의 UI상태에 관여하는 메서드 호출을 하지 않고, 대신 Scene Delegate에서 메서드를 호출한다.<br>

<br>

### LifeCycle

어떤 어플을 실행하고 싶어서 눌렀다고 가정했을 때<br>
AppDelegate에서 didFinishLaunching을 호출하여 UI가 아닌 일회성 설정을 진행한다.<br>

<br>

시스템이 scene session을 생성하는데, 이를 위해 앱에게 UIScene Configuration에 대하여 물어보게 된다.<br>

```swift
func application(_ application: UIApplication,
			     configurationForConnecting connectingSceneSession: UISceneSession,
			      options: UIScene.ConnectionOptions) -> UISceneConfiguration
```
이러한 scene configuration은 scene delegate, storyboard 등으로 알 수 있으며, 이러한 구성은 info.plist에서 정적으로 정의하거나 코드로 동적 정의할 수 있다.<br>
이런 식으로 정의한 scene configuration로는 main sceneConfiguration과 accessory sceneConfiguration을 가질 수 있다.<br>

<br>

이때 앱이 실행되고 scene session도 가질 수 있으나, UI를 확인할 수 없다.<br>
Scene Delegate에서 scene함수에 매개변수로 입력된 scene을 사용하여 새로 지정된 UIWindow를 설정한다.<br>
이때 User Activity나 state Restoration activity도 확인해야 한다.<br>
이렇게 Scene Delegate의 willConnectToSession에서 앱에 UI가 보이게 된다.<br>

<br>

사용자가 홈 화면으로 가기 위해 홈버튼을 누르거나 위로 스와이프할 경우, willResignActive, didEnterBackground 메서드가 호출되어 active상태를 포기하고 scene을 background로 보내게 된다.<br>
그러다가 어느 시점에서 didDisconnect가 호출되어 scene의 연결이 해제될 수 있는데, 이는 시스템이 사용하지 않는 scene에게 자원을 주고 싶어하지 않기 때문에 background에 있는 scene을 메모리에서 해제해버릴 수 있기 때문이다.<br>
이런 식으로 scene이 해제되면 이를 보유한 모든 윈도우 계층, 뷰 계층도 해제된다.<br>

<br>

사용자가 직접 스와이프하여 앱을 제거하면 App Delegate의 didDiscardSceneSession이 호출되며, 이는 scene의 저장되지 않은 데이터나 상태를 영구적으로 위임할 수 있는 기회를 제공한다.<br>
만약 프로세스가 실행중이지 않았다면 (switcher 상태에 있을 경우) 시스템은 버려진 세션들을 추적하고, 다음 앱 실행 직후 이를 호출하게 된다.<br>

<br>

### State Restoration
iOS13에서 앱은 scene 기반 상태 복원을 구현하는 것이 중요하다.<br>
에를 들어 app switcher에서 구동 중인 session이 여러 개 있다면, 어느 시점에 사용하지 않는 session들은 시스템에 의해 연결 해제 된다.<br>
이때 이 앱이 상태 복원을 구현하지 않은 앱이라면, 해당 세션으로 돌아갈 때 이전 상태로 돌아갈 수 없을 것이다.<br>
따라서 iOS13은 새로운 scene-based 상태 복원 API를 가지고 상태를 인코딩하여 창을 다시 생성할 수 있다.<br>
이는 모두 NSUserActivity를 기반으로 하며, 앱은 스포트라이트 검색, handoff와 같은 기능들을 활용하는 동안 동일한 활동을 사용하여 앱의 상태를 인코딩할 수 있다.<br>
```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
		let currentActivity = fetchCurrentUserActivity(for: self.window)
		return currentActivity
	}

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options: .ConnectionOptions) {
		if let restorationActivity = session.stateRestorationActivity {
			self.configure(window: window, with: restorationActivity)
		}
	}
}
```
Scene Delegate에서 scene에 대한 stateRestorationActivity를 구현한 뒤, 현재 창에서 가장 활동적인 사용자 활동을 찾는 메서드(fetchCurrentUserActivity)를 호출한 뒤 반환한다.<br>
잠시 후 scene이 foreground로 다시 들어와서 연결되면 session에 stateRestorationActivity가 있는지 확인하고 있다면 이를 사용하고, 없다면 그냥 새로운 윈도우를 생성한다.<br>
이에 따라 사용자는 background에서 scene의 연결이 끊기는 것을 알 수 없다.<br>

<br>

### Scene의 동기화 상태 유지
본래 앱마다 하나의 UI가 존재하는 iOS의 앱은 뷰 컨트롤러에서 이벤트를 수신하고, 자신의 UI를 업데이트하며 모델 및 모델 컨트롤러에게 이를 알리게 된다.<br>
하지만 UI가 2개 이상이 될 경우, 한쪽 scene에 이벤트가 발생하더라도 다른 쪽 뷰 컨트롤러는 이벤트가 발생하지 않았기 떄문에 UI를 변경하지 않는다.<br>
이를 해결하기 위해 뷰 컨트롤러가 이벤트를 수신하고 모델 컨트롤러에게 알리면, 모델 컨트롤러가 연결된 뷰 컨트롤러에게 새로운 데이터로 업데이트하라고 알리는 방법이 존재한다.<br>
```swift
class ChatViewController: UIViewController {
	@objc func didEnterMessage(sender: UITextField) {
		let message = Message(text: sender.text)

		self.animateNewRow(for: message)
		self.updateBadgeCount()
		ChatModelController.shared.add(message: message)
	}
}
```
위 코드는 2개의 UI 뷰가 존재하더라도 하나의 뷰 컨트롤러만 수정되는 상황의 코드이다.<br>
didEnterMessage 메서드는 메시지 보내기 버튼을 누르면 호출되는 메서드이며, 뷰 컨트롤러는 이 경우 자신의 뷰를 업데이트하고, 모델 컨트롤러에게 이를 반영하라고 알리게 된다.<br>

```swift
class ChatViewController: UIViewController {
	
	override func viewDidLoad() {
		NotificationCenter.default.addObserver(selector: …, name: .NewMessageNotificationName)

	@objc func handle(notification: Notification) {
		let event = notification.object as! UpdateEvent

		switch event {
		case .NewMessage(message: newMessage):
			self.animateNewRow(for: newMessage)
			self.updateBadgeCount()
		}
	}

	@objc func didEnterMessage(sender: UITextField) {
		let message = Message(sender: UITextField)
		ChatModelController.shared.add(message: message)
	}
}

class ChatModelController {
	static let shared = ChatModelController()

	func add(message: Message) {
		saveToDisk(message)

		let event = UpdateEvent.NewMessage(message: message)
		event.post()
	}
}

enum UpdateEvent {
	case NewMessage(message: Message)

	static let NewMessageNotificationName = Notification.Name(rawValue: “NewMessage”)
	func post() {
		switch self {
		case .NewMessage(message: _): NotificationCenter.default.post(
			name: UpdateEvent.NewMessageNotificationName,
			object: self
			)
		}
	}
}
```
