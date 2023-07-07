# @Environment

Swift의 속성 래퍼 중 하나로, 여러 UI 레이어를 통해 전파되는 환경 값에 접근하게 해준다.<br>
공유 데이터 또는 상태를 관리하기 위해 여러 환경 값을 사용하며, 이 값들은 @Environment 특성을 사용하여 접근 가능하다.<br>
사용자의 시스템 설정 (인터페이스 스타일, locale, 캘린더 등)을 어플리케이션에서 접근해야 하는 경우, @Environment 속성 래퍼를 통하여 접근 가능하다.<br>

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

