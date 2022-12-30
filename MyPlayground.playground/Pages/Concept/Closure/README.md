# Closure

### - Closure : 내부 함수와 내부 함수가 만들어진 주변 환경(Context)으로 이루어진 객체<br>

클로저에는 Named Closure와 Unnamed Closure가 있는데, 이중 Named Closure는 함수라고 한다.<br>
Unnamed Closure는 이름을 붙이지 않고 사용하는 익명 함수를 말한다.<br>
클로저는 Argument Label을 사용하지 않는다.<br>
<br>
클로저는 전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달할 수 있으며 함수의 반환 값의 역할을 할 수 있다.<br>
<br>

### - Closure의 표현식
```swift
{(매개 변수) -> 리턴 타입 in
  실행 구문
}
```
> 클로저 헤드 : (매개 변수) -> 리턴 타입<br>클로저 바디 : 실행 구문

### - Closure의 유형
> #### 1. 파라미터와 리턴 타입이 모두 없는 클로저
> ```swift
> let closure = { () -> () in
>   실행 구문
> }
> ```
> 클로저는 변수나 상수에 대입할 수 있고, 기존에 클로저를 대입한 변수나 상수를 새로운 변수 또는 상수에 대입하는 것이 가능하다.<br>
> 
> #### 2. 클로저를 함수의 파라미터 타입으로 전달하는 경우
> ```swift
> func doSomething(closure: () -> ()) {
>   closure()
> }
> //위의 코드는 함수를 파라미터로 전달받는 doSomething이라는 함수이다.
> doSomething(closure: {() -> () in
>   실행 구문
> })
> //다음과 같이 클로저를 파라미터로 넘겨줄 수 있다.
> ```
> 
> #### 3. 함수의 반환 타입을 클로저를 사용하는 경우
> ```swift
> func doSomething() -> () -> () {
>   return { () -> () in
>     실행 구문
>   }
> }
> let closure = doSomething()
> closure()
> ```

### - Closure 호출 방법
> #### 1. 클로저가 대입된 변수나 상수로 호출
> ```swift
> let closure = {() -> String in
>   return "String"
> }
> closure()
> ```
> #### 2. 클로저를 직접 실행
> ```swift
> ({() -> () in
>   print("Hello")
> })()
> ```
> 클로저를 소괄호()로 감싸고, 마지막에 호출 구문인 ()를 추가해준다. (일회성 사용)<br>


### - 예시 코드 1
```swift


let hello = {(name: String) -> String in
  return "Hello, \(name)"
}

hello(name:"kbs")  //전달인자 레이블을 사용하지 않기 때문에 오류
hello("kbs")       //Hello, kbs
```
### - 예시 코드 2 : 동일 클로저 코드 표현법
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
### - 예시 코드 3 : 함수가 클로저를 argument로 받는 상황
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
