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
- 예시 코드 2 : 동일 클로저 코드 표현법
```swift
var multiply: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
  return a * b
}

//파라미터(매개변수)의 타입 생략
var multiply2: (Int, Int) -> Int = {(a, b) -> Int in
  return a * b
}

//return 키워드 및 파라미터(매개변수) 생략 (shorthand argument 활용)
var multiply3: (Int, Int) -> Int = {$0 * $1}
```
- 예시 코드 3 : 함수가 클로저를 argument로 받는 상황
```swift
func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a,b)
    return result
}

var add: (Int, Int) -> Int = { a,b in
    return a + b
}

operateTwoNum(a: 4, b: 9, operation: multiply)  // multyply를 넣으면 곱하기
operateTwoNum(a: 4, b: 9, operation: add) // add 클로저를 넣어 더하기
operateTwoNum(a: 4, b: 9 ){ a, b in // 아규먼트 블럭에 클로저를 직접 구현해도 된다.
    return a - b
}
```
