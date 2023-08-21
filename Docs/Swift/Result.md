## Result

```swift
enum Result<Success, Failure: Error> {
	case success(Success)
	case failure(Failure)
}
```

Result 는 성공과 실패를 명시적으로 나타낼 수 있으며, 코드의 가독성을 향상시킨다.

<br>

실패 가능한 작업을 처리하기 위해 기존에는 do, try, catch, throws 문법을 활용할 수  있었지만, 이 방법에는 다음과 같은 단점이 존재한다.

- 실제로 에러를 처리하기 위하여 필요한 상태(state)보다 더 많은 상태가 생겨 불필요한 상태를 추가적으로 처리해야 한다.
- 비동기 코드에서 throw를 사용하는 경우, completion handler를 통해 오류를 전달해야 하는데 이는 코드를 복잡하게 만드는 원인이 될 수 있다.
- throwing function 은 이 함수나 메서드가 Error를 던질 수 있다는 것을 나타낼 뿐, 에러의 형식을 특정할 수 없다. catch 로 에러가 올 때, 실제 에러가 아닌 에러 프로토콜 형식으로 전달되는데 이때 모호함이 발생한다. 따라서 에러를 처리하기 위해서는 어떤 에러를 던지는지 파악 후 해당 형식으로 타입 캐스팅을 해야 한다. 새로운 에러 형식이 추가되어도 컴파일러는 이를 인지하지 못하므로, 새로운 에러에 대한 처리가 없으면 런타임 에러의 위험성이 생긴다.

<br>

### 예시

```swift
// 오류 타입 정의
enum UserError: Error {
	case nameTooShort
	case nameContainsInvaildCharacters
}

// 사용자 이름을 검증하는 함수
func validateUserName(name: String) -> Result<String, UserError> {
	if name.count < 3 {
		return .failure(.nameTooShort)
	}
}

// 위 함수를 호출하고 Result 값에 따른 처리

let result = validateUserName(name: "Kim")

switch result {
case .success(let validName):
	// validName을 활용한 코드...
case .failure(let error):
	switch error {
	case .nameTooShort:
		// 에러 처리
	case .nameContainsInvalidCharacters:
		// 에러 처리
	}
}
```
