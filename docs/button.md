# Button

<img width="314" alt="스크린샷 2023-01-09 오전 6 56 16" src="https://user-images.githubusercontent.com/63408930/211221056-e464fd5e-c3a6-4c06-8fd4-7788f6dc5db4.png">


어플리케이션 화면에 버튼을 추가한다.<br>
Button은 String을 인자로 받고, 버튼을 눌렀을 때의 콜백을 클로저 블록 내에 작성할 수 있다.

```swift
@State var touchedCount = 0
var body: some View {
  Button("this is Button") {
    self.touchedCount += 1
  }
}
```
구조체의 특성상 내부 메서드 안에서 자신의 변수를 변경할 수 없다. (struct ContentView)<br>
따라서 변수에 State 어노테이션을 선언해준다.<br>
SwiftUI에서는 State 어노테이션이 붙은 변수에 변경이 일어나면 자동으로 View를 다시 렌더링한다.
