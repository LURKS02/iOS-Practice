# @Main

```swift
@main
struct MyApplication {
	static func main() {
	
	}
}
```

프로그램 실행 시작 시 진입점으로 타입을 지정하기 위한 Swift 언어의 기능<br>
@UIApplicationMain 또는 @NSApplicationMain 속성의 확장으로 볼 수 있으며, 기존의 속성들은 UIKit 또는 AppKit에 종속되어 있었지만 @Main은 종속성을 없애고 앱의 시작점을 지정할 수 있는 더 일반적인 방법을 제공한다.<br>
이 타입은 반드시 main()함수를 정의해야 하는데, 이 함수는 앱 실행 시 가장 먼저 호출되는 함수이다.<br>

<br>

### 장점
어플리케이션의 진입점을 명시적으로 지정하여 앱 실행 시작 시 호출되는 코드를 분리하고 가독성을 높일 수 있다.<br>
어플리케이션의 진입점을 명확하게 구분하고, 코드의 가독성과 유지보수성을 향상시킬 수 있다.<br> 
<br>

### AppDelegate와의 관계
@main 어트리뷰트를 사용하더라도, 여전히 AppDelegate 클래스의 인스턴스가 생성되고, application(_:didFinishLaunchingWithOptions:) 메서드가 호출된다.<br>
그러나 @main 사용 시, AppDelegate 클래스에 직접 앱의 진입점을 설정하는 코드를 작성할 필요가 없다.<br>
@main 어트리뷰트가 있는 클래스의 main() 메서드가 호출되면, 해당 클래스는 앱의 진입점으로 설정되고, 그 안에서 AppDelegate 인스턴스가 생성되어 application(_:didFinishLaunchingWithOptions:) 메서드가 호출된다.<br>
