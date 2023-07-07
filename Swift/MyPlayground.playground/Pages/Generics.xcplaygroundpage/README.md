# Generics

- Generics(제네릭) : 파라미터로 제공되는 타입을 이용하여 함수를 사용할 수 있게 해줌
```swift
func call<Item>(name: Item, num: Int) -> Void {
    for _ in 0..<num {
        print(name)
    }
}
call(name: "KIA", num: 2)  //파라미터가 String일 때
call(name: 5, num: 5)      //파라미터가 Int일 때
```
꺾쇠 괄호 <> 안에 적은 타입대로 함수가 동작하게 된다.
