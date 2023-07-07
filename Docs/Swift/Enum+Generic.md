# Enum+Generic

```swift
enum ResultView<T: View>: View {
	case success(T)
	case failure(T)

	var body: some View {
		switch self {
			case .success(let contentView):
				contentView
			case .failure(let contentView):
				contentView
			}
		}
	}
}
```

Generic patameter T는 View 프로토콜을 따르는 모든 타입을 받을 수 있다.<br>
success / failure의 두 가지 케이스에 따라 다른 View를 출력한다.<br>



```swift
enum Error<Success, Failure> {  // 두 개의 타입이 들어올 수 있음을 알려준다.

	case success(Success)
	case connectionError(Failure)

	func printStatus() {
		switch self {

		case .success(let message):
			print(message)
		case .connectionError(let message):
			print(message)
		}
	}
}

func setNetwork(_ choice: Bool) -> Error<String, String> {
	if choice {
		return .success("통신 성공")
	}
	else {
		return .connectionError("연결 오류")
	}
}

setNetwork(false).printStatus()
```

