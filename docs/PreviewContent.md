# PreviewContent

Canvas 기능을 통해 Simulator 없이도 Xcode에서 화면을 미리 볼 수 있게 해준다.

- ContentView_Preview
```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
실제 앱에는 적용되지 않지만 Xcode의 Canvas 기능을 위한 Preview Layout<br>
Simulator를 켜서 View를 실시간으로 확인할 수 있다.<br>
