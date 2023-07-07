# AnyView

View 프로토콜을 준수하는 모든 타입을 wrap하는 타입<br>
SwiftUI 뷰의 타입이 런타임에 변할 수 있는 경우 사용된다.<br>

```swiftui
struct ContentView: View {
	@State private var isShowingText = false

	var body: some View {
		if isShowingText {
			return Text("Hello")
		}
		else {
			return Button("Show Text") {
				isShowingText = true
			}
		}
	}
}
```
이 경우 body의 한 경로는 Text를, 다른 경로는 Button을 반환하므로 컴파일러는 오류를 반환한다.<br>

```swiftui
struct ContentView: View {
	@State private var isShowingText = false

	var body: some View {
		if isShowingText {
			return AnyView(Text("Hello"))
		}
		else {
			return AnyView(Button("Show Text") {
				isShowingText = true
			})
		}
	}
}
```
이제 body의 모든 경로에서 AnyView를 반환하게 된다.<br>
