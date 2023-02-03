# Identifiable

인스턴스의 유일성을 보장하기 위해 ID값을 설정할 것을 강제하는 프로토콜

```swift
struct User: Identifiable {
  var id: Int
  var userName: String
}
let user = User(id: 1, userName: "jake")
```

```swift
struct User: Identifiable {
  let id = UUID()
  var userName: String
}
let user = User(userName: "jake")
```
