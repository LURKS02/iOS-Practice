# Padding

<img width="347" alt="스크린샷 2023-01-10 오전 9 41 34" src="https://user-images.githubusercontent.com/63408930/211436336-79423120-615a-4558-9f6d-9066b003c490.png">

```swift
VStack {
  Text("Hello, World!")
    .background(.red)
    .padding()
  Text("padding test")
    .background(.yellow)
    .padding()
  Text("TEST")
    .background(.blue)
    .padding()
}
```
여백을 주는 기능으로, 기본값은 상하좌우에 여백을 준다.

<br>


<img width="351" alt="스크린샷 2023-01-10 오전 9 47 12" src="https://user-images.githubusercontent.com/63408930/211436804-038f49c5-9ed8-46d0-a773-5895b690948d.png">

```swift
VStack {
  Text("Hello, World!")
    .background(.red)
    .padding(.top, 200)
  Text("padding test")
    .background(.yellow)
    .padding(.leading, 100)
  Text("TEST")
    .background(.blue)
    .padding()
}
```

숫자 값을 넣어주면 여백의 크기를 지정할 수 있다.<br>
기본 값은 상하좌우 여백을 주며 .top / .bottom / .leading / .trailing 값을 첫 번째 인자로 넣어주면 여백의 방향을 지정할 수 있다.
