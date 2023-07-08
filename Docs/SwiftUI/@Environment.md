# @Environment

### EnvironmentValues

```swiftui
struct EnvironmentValues
```
뷰 계층 구조를 통해 전파되는 환경 값들의 집합<br>
SwiftUI에서는 EnvironmentValues 구조체를 통해 어플리케이션 뷰에게 환경 값을 노출한다.<br>
해당 구조체에서 값을 읽어오기 위해서는, Environment 프로퍼티 래퍼를 사용하여 프로퍼티를 선언한 뒤 값의 키 경로를 지정해주어야 한다.<br>
```swiftui
@Environment(\.locale) var locale: Locale
```
SwiftUI는 디바이스 특성, 시스템의 상태, 유저 세팅에 따라 pixelLength, scenePhase, locale과 같은 환경 값들을 자동으로 세팅하고 업데이트한다.<br>

```swiftui
MyView().environment(\.lineLimit, 2)
```
environment(_:_:) view modifier를 통해 값을 세팅하거나 오버라이드 할 수 있다.<br>
```swiftui
MyView().lineLimit(2)
```
다음과 같이 직접 값을 설정하는 대신 환경 값을 설정하는 전용 view modifier를 사용하는 것이 좋다.<br>

<br>

### Environment

Swift의 속성 래퍼 중 하나로, 여러 UI 레이어를 통해 전파되는 환경 값에 접근하게 해준다.<br>
공유 데이터 또는 상태를 관리하기 위해 여러 환경 값을 사용하며, 이 값들은 @Environment 특성을 사용하여 접근 가능하다.<br>
사용자의 시스템 설정 (인터페이스 스타일, locale, 캘린더 등)을 어플리케이션에서 접근해야 하는 경우, @Environment 속성 래퍼를 통하여 접근 가능하다.<br>

<br>

### EnvironmentKey
EnvironmentKey 프로토콜을 준수하는 유형을 정의하고, 환경 값 구조체에 새로운 프로퍼티를 추가하여 사용자 정의 환경 값을 생성할 수 있다.<br>
키를 사용하여 값을 가져오거나 설정할 수 있으며, client를 위하여 값을 설정하기 위한 전용 수정자를 제공할 수 있다.<br>
```swiftui
private struct MyEnvironmentKey: EnvironmentKey {
	static let defaultValue: String = "Default Value"
}

extension EnvironmentValues {
	var myCustomValue: String {
		get { self[MyEnvironmentKey.self] }
		set { self[MyEnvironmentKey.self] = newValue }
	}
}

extension View {
	func myCustomValue(_ myCustomValue: String) -> some View {
		environment(\.myCustomValue, myCustomValue)
	}
}
```

<br>

### Custom Environment
#### 1. 환경 키 만들기
```swiftui
private struct CaptionColorKey: EnvironmentKey {
	static let defaultValue = Color(.secondarySystemBackground)
}
```
Environment 프로토콜을 채택한 타입을 만들고, defaultValue 타입 프로퍼티를 정의해준다.<br>
defaultValue는 해당 키에 대한 기본값으로, 값의 타입을 결정한다.<br>

#### 2. 환경 확장
```swiftui
extension EnvironmentValues {
	var captionBackgroundColor: Color {
		get { self[CaptionColorKey.self] }
		set { self[CaptionColorKey.self] = newValue }
	}
}
```
EnvironmentValues 타입에 실제 사용할 이름의 연산 프로퍼티를 추가하고, getter와 setter를 정의한다.<br>

#### 3. 뷰 수정자 추가 (선택)
```swiftui
ContentView()
	.environment(\.captionBackgroundColor, .yellow)
```
```swiftui
extension View {
	func captionBackgroundColor(_ color: Color) -> some View {
		environment(\.captionBackgroundColor, color)
	}
}
```
```swiftui
ContentView()
	.captionBackgroundColor(.yellow)
```

#### 4. 사용
```swiftui
@Environment(\.captionBackgroundColor) var backgroundColor
```
