# Stack

Xcode에서 View 프로토콜을 채택하여 사용할 때, 최상위 View 역할을 할 body 연산 프로퍼티를 필수적으로 구현해주어야 한다.<br>
이때 body 프로퍼티의 타입은 some View로, 불투명 타입(Opaque Type)이므로 내부에서 View를 준수하고 있는 객체라면 어떤 객체든 리턴이 가능하다.<br>
하지만 단 한개의 View만을 리턴해야 하는데, 이때 Stack, Group 등의 컨테이너를 사용하여 여러 개의 View들을 감싸주게 된다.

<br>

## 1. HStack
### View를 수평(Horizontal)으로 배치해주는 View<br>
내부에 선언된 View들을 Leading에서 Trailing으로 배치한다.<br>

<img width="313" alt="스크린샷 2023-01-09 오전 7 28 02" src="https://user-images.githubusercontent.com/63408930/211222289-c285d31e-9b9e-43fb-83f7-26686596e0d3.png">

```swift
HStack {
  Text("HStack").background(.red)
  Text("수평").background(.blue)
}
```
내부에 선언된 요소를 Leading에서 Trailing으로 순서대로 수평 배치한다.

<br>

## 2. VStack
### View를 수직(Vertical)으로 배치해주는 View<br>
내부에 선언된 View들을 Top에서 Bottom으로 배치한다.<br>

<img width="335" alt="스크린샷 2023-01-09 오전 7 36 32" src="https://user-images.githubusercontent.com/63408930/211222589-26dabbf7-c81e-42a6-bc58-65f7d048d38d.png">

```swift
VStack {
  Text("VStack").background(.red)
  Text("수직").background(.blue)
}
```
내부에 선언된 요소를 Top에서 Bottom으로 순서대로 수직 배치한다.

<br>

## 3. ZStack
### 내부에 선언된 View들을 겹쳐서 두 축으로 배치하는 View<br>

<img width="326" alt="스크린샷 2023-01-09 오전 7 45 20" src="https://user-images.githubusercontent.com/63408930/211222872-0fcc4cb9-bad6-42bf-8cee-ea7eee2915aa.png">

```swift
ZStack {
  Text("ZStack").background(.red)
  Text("겹침").background(.blue)
}
```
먼저 선언된 View일수록 뒤에 배치된다.
