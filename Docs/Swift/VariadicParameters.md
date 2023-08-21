## Variadic Parameters

함수나 메소드에 임의 개수의 입력값을 전달할 수 있는 기능

해당 매개변수의 타입 이름 뒤에 **…** 를 붙여 사용한다.

```swift
func sum(numbers: Int...) -> Int {
	var total = 0
	for number in numbers {
		total += number
	}
	return total
}

let result = sum(numbers: 1, 2, 3, 4, 5)
```
