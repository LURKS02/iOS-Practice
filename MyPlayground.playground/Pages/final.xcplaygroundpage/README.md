# Final(파이널)

- Final

class 앞에 키워드를 붙이면 해당 클래스를 상속할 수 없게 된다.<br>
런타임 성능이 향상된다.

```swift
final class Friend {
    var name: String
    init(name: String) {
        self.name = name
        print("부모 클래스")
    }
}

class bestFriend: Friend {  //컴파일 에러
    override init(name: String) {
        super.init(name: "sub" + name)
        print("자식 클래스")
    }
}
```
