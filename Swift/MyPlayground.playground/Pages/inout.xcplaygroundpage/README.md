# Inout

스위프트 메서드에서 사용되는 인자값(parameters)은 기본적으로 그 값이 변하지 않는 상수(constants)로 되어있다.<br>
따라서 메서드 블록 내에서 메서드의 인자값 상수를 변경하면 컴파일 타임 에러가 발생한다.<br>
```swift
func swap(_ aVal: Int, _ bVal: Int) {
  let tempVal = aVal
  aVal = bVal
  bVal = tempVal
}  //컴파일 타임 에러
```

- In-Out Parameters
> in-out 매개변수는 메서드에서 전달되는 변수 값이 된다.<br>
> 메서드 블럭 내에서 값이 변경될 수 있다.<br>
> 메서드가 종료된 후에도 원본 변수에 그 변화 값이 copy-in, copy-out 방식으로 전달된다.<br>
> 해당 매개변수로 상수가 아닌 변수(variable)가 들어간다. (리터럴 값은 in-out 매개변수로서 사용될 수 없다.)<br>
> in-out 매개변수는 기본값을 가질 수 없다.
```swift
func swap(_ aVal: inout Int, _ bVal: inout Int) {
    let tempVal = aVal
    aVal = bVal
    bVal = tempVal
}

var firstInt = 100
var secondInt = 200
swap(&firstInt, &secondInt)
print("firstInt : \(firstInt), secondInt : \(secondInt)")
```
메서드에서 swap된 값은 메서드가 종료된 뒤에도 원본 값에 적용된다.
