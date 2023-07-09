# UIViewPresentableContext의 Coordinator 구현 문제

@MainActor public struct UIViewRepresentableContext<Representable> 을 보면 @MainActor public let coordinator: Representable.Coordinator 를 가지고 있다.<br>
이떄 Coordinator 타입은 UIViewRepresentable 프로토콜을 채택하는 타입이 지정하는 Coordinator 타입을 가지게 된다.<br>
하지만 UIViewRepresentable을 채택하는 타입이 Coordinator 타입을 명시적으로 지정하지 않았을 경우, UIViewRepresentable 프로토콜은 Coordinator 타입을 기본적으로 Void로 지정하게 된다.<br>
따라서 다음과 같이 delegate를 설정하면 오류가 발생한다.<br>
```swift
struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) ->
    UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator // 오류 : context.coordinator가 void이므로 delegate로 지정할 수 없음
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
```
<br>
따라서 다음과 같이 UIViewRepresentable을 채택하는 타입 내에서 Coordinator 타입을 정의해주어야 한다.<br>
<br>

```swift
struct SearchBar: UIViewRepresentable {
  @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) ->
    UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
}

extension SearchBar {
    final class Coordinator: NSObject, UISearchBarDelegate {
        let text: Binding<String>
        
        init(text:Binding<String>) {
            self.text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text.wrappedValue = searchText
        }   
    }
}
```
