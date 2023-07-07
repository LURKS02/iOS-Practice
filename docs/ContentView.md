# ContentView.swift

맨 처음 생성되는, Simulator를 실행하면 출력되는 View<br>
```swift
struct ContentView: View {
    var body: some View {
    }
}
```
- View
```swift
public protocol View {

    associatedtype Body : View
    
    @ViewBuilder @MainActor var body: Self.Body { get }
    
}
```
프로토콜로 구현되어 있고, body라는 프로퍼티를 가진다.<br>
ContentView 구조체는 View를 채택하고 있으므로 body라는 프로퍼티를 가져야 한다.<br>
ContentView의 최상위 View 역할을 하는 body가 화면에 그려지게 된다.<br>
body는 some View (불투명 타입)을 리턴하므로 VStack 등의 자유로운 리턴이 가능하다.<br>

<br>

- ContentView 특징
> 1. body는 단 한개의 View만 반환한다. (따라서 여러 개의 View를 하나의 View로 감싸 하나의 View로 리턴해야 한다. : Stack, Group 등)<br>
> 2. View의 생애주기를 관리할 때는 onAppear / onDisappear 를 사용한다.
> 3. 최상위 View는 최대 10개의 Child View를 가질 수 있고 초과시 다른 태그를 이용하여 감싸주어야 한다.
