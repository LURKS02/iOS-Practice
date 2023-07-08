# @Escaping

### Non-Escaping Closure
함수의 실행이 종료되기 전에 실행되는 클로저<br>
컴파일러가 해당 클로저의 실행이 언제 종료되는지 알고 있으므로, 때에 따라 클로저에서 사용하는 특정 객체에 대한 retain, release 등의 처리를 생략하여 객체의 life cycle을 효율적으로 관리할 수 있다.<br>

```swift
func runClosure(closure: () -> Void) { // 1. 클로저가 runClosure()함수의 closure인자로 전달
	closure() // 2. 함수 안에서 closure()가 실행됨
} // 3. runClosure() 함수가 값을 반환하고 종료
```
위 코드에서 클로저는 함수가 종료되기 전에 실행되므로 Non-Escaping 클로저이다. <br>

<br>

### Escaping Closure

클로저가 함수의 인자로 전달되었을 때, 함수의 실행이 종료된 후 실행되는 클로저<br>
클로저가 함수 밖에서 실행되는 것을 보장하기 위하여 클로저에서 사용하는 객체에 대한 추가적인 참조 사이클(reference cycles) 관리가 필요하며, 이는 컴파일러의 퍼포먼스 및 최적화에 영향을 끼칠 수 있다.<br>

```swift
class ViewModel {
	var completionHandler: (() -> Void)? = nil
	
	func fetchData(completion: @escaping () -> Void) { // 1. 클로저가 fetchData() 함수의 completion 인자로 전달
		completionHandler = completion // 2. 클로저 completion이 completionHandler 변수에 저장
	} // 3. fetchData() 함수가 값을 반환하고 종료
}
// 4. completion은 실행되기 전
```
위 코드에서 completion은 함수의 실행이 종료되기 전에 실행되는 함수가 아니므로 escaping 클로저 (함수 밖에서 실행되는 클로저) 이다.<br>

```swift
// 비동기 HTTP Request CompletionHandler
func makeRequest(_ completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
	URLSession.shared.dataTask(with: URL(string: "")!) { data, response, error in
		if let error = error {
			completion(.failure(error))
		} else if let data = data, let response = response {
			completion(.success((data,response))
		}
	}
}
```
위 코드에서 completion 클로저는 함수 실행 중에 즉시 실행되지 않고 URL 요청이 끝난 후 비동기로 실행된다.<br>
위와 같이 클로저가 다른 변수에 저장되어 나중에 실행되거나 비동기로 실행될 때 escaping 클로저가 사용된다.<br>
