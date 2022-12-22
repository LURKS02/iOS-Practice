# Closure

- Closure : 내부 함수와 내부 함수가 만들어진 주변 환경(Context)으로 이루어진 객체
일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것이다.
<br>
클로저는 전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달할 수 있으며 함수의 반환 값의 역할을 할 수 있다.

- Closure의 표현식
```swift
{(매개 변수) -> 리턴 타입 in
실행 구문
}
```
> 클로저 헤드 : (매개 변수) -> 리턴 타입<br>클로저 바디 : 실행 구문

- 예시 코드 1
```swift


let hello = {(name: String) -> String in
  return "Hello, \(name)"
}

hello(name:"kbs")  //전달인자 레이블을 사용하지 않기 때문에 오류
hello("kbs")       //Hello, kbs
```
- 예시 코드 2
```swift
let sum:(Int, Int) -> Int = {(a:Int, b:Int) in
  return a + b
}
let sumResult: Int = sum(1, 2)

let add:(Int, Int) -> Int
add = {(a:Int, b:Int) in
  return a + b
}
```
- 예시 코드 3
```swift
func doClosure(closure: () -> ()){
  closure()
}

doClosure(closure: { () -> () in
  print("Hello")
})
```
