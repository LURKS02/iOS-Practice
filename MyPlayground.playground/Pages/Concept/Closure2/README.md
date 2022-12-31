# Closure의 경량화

### 1. 트레일링 클로저(Trailing Closure)
함수의 마지막 파라미터가 클로저일 때 이를 파라미터 값 형식이 아닌 함수 뒤에 붙여 작성하는 문법이다.<br>
Argument Label은 생략된다.

```swift
func doSomething(closure: () -> ()) {
  closure()
}

doSomething(closure: {() -> () in
  print("Something")
})  //Inline Closure : 클로저가 파라미터 값 형식으로 함수 호출 구문 안에 작성되어 있는 것
```
```swift
doSomething(){ () -> () in
  print("Something")
})
//또는
doSomething { () -> () in
  print("Something")
}
```
클로저가 마지막 파라미터일 때, Argument Label이 생략된다.

### 2. 경량 문법
```swift
func doSum(closure: (Int, Int, Int) -> Int) {
  closure(1, 2, 3)
}
doSum(closure: {(a: Int, b: Int, c: Int) -> Int in
  return a + b + c
})
```
- 파라미터 형식과 리턴 형식을 생략할 수 있다.
> ```swift
> doSum(closure: {(a: Int, b: Int, c: Int) -> Int in
>   return a + b + c
> })
> ```
> ```swift
> doSum(closure: {(a, b, c) in
>   return a + b + c
> })
> ```
- Parameter Name은 Shorthand Argument Names로 대체하고, Parameter Name과 in 키워드를 삭제한다.
> ```swift
> doSum(closure: {(a, b, c) in
>   return a + b + c
> })
> ```
> ```swift
> doSum(closure: {
>   return $0 + $1 + $2
> })
> ```
> $와 index를 이용해 Parameter에 순서대로 접근한다.
- 단일 리턴문만 남을 경우, return도 생략한다.
> ```swift
> doSum(closure: {
>   return $0 + $1 + $2
> })
> ```
> ```swift
> doSum(closure: {
>   $0 + $1 + $2
> })
> ```
- 클로저 파라미터가 마지막 파라미터면, 트레일링 클로저로 작성한다.
> ```swift
> doSum(closure: {
>   $0 + $1 + $2
> })
> ```
> ```swift
> doSum() {
>   $0 + $1 + $2
> }
> ```
- ()에 값이 없다면 생략한다.
> ```swift
> doSum() {
> $0 + $1 + $2
> }
> ```
> ```swift
> doSum {
> $0 + $1 + $2
> }
> ```

### 3. @autoclosure
파라미터로 전달된 일반 구문 또는 함수를 클로저로 래핑(Wrapping)하는 것
```swift
func doMore(closure: @autoclosure () -> ()) {
}
doMore(closure: 1 > 2)
```
파라미터 함수 정의 앞에 붙이며, 실제 클로저를 전달받지 않지만 일반 구문을 클로저처럼 사용이 가능하다.<br>
이때 반드시 파라미터가 없어야 한다.<br>
함수가 실행되는 시점에 클로저로 구문을 만들어주므로 지연되어 실행된다.
### 4. @escaping
함수의 실행을 벗어나 함수가 종료된 후에도 클로저를 실행하고 싶은 경우 사용한다.<br>
중첩 함수에서 실행 후 중첩 함수를 리턴하고 싶은 경우 사용한다.
```swift
func doMore(closure: @escaping () -> ()) {
  let f: () -> () = closure
}  //변수나 상수에 파라미터로 받은 클로저 대입 가능

func doMore(closure: @escaping () -> ()) {
  DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    closure()
  }
}
doMore { print(“closure”)}
```
