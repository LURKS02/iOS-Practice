# UIViewRepresentable

UIKit View를 SwiftUI에서 사용할 수 있도록 랩핑해주는 wrapper<br>
SwiftUI 인터페이스에서 UIView 객체를 생성하고 관리할 수 있다.<br>

```swiftui
struct ActivityIndicator: UIViewRepresentable {
	func makeUIView(context: Context) -> UIActivityIndicatorView {
		UIActivityIndicatorView()
	}
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
	
}
}
```
커스터마이징 할 struct를 정의한 뒤, 해당 struct에 UIViewRepresentable을 conform 해준다.<br>
- makeUIView(context:) -> UIView
UIView를 생성하는 메소드로, SwiftUI의 View 라이프 사이클 동안 한번 호출된다.<br>
래핑하고자 하는 UIView를 생성하여 리턴한다.<br>
- updateUIView(:context:)
SwiftUI View의 State가 바뀔 때마다 트리거되며, View의 정보를 업데이트하거나 <Binding>을 통해 상태를 가져올 수 있다.<br>
