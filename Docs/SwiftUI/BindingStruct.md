# Binding 구조체
```swift
let myBinding = Binding<String>
```
실제로 상태를 바인딩하는 구조체로 쓰이며, 상태의 get과 set이 가능해 다른 뷰와 상태를 공유할 수 있다.<br>

```swift
struct CustomView: View {
	@State private var text: String = ""
	
	var body: some View {
		TextField("Enter Text", text: textBinding)
	}
	
	private var textBinding: Binding<String> {
		Binding(
			get: { self.text },
			set: { self.text = $0.uppercased() }
		)
	}
}
```
