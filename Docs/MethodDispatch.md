# Method Dispatch

프로그램이 메소드 호출을 어떻게 처리하고 실행하는지에 대한 매커니즘<br>

### Static Dispatch
컴파일 타임에 컴파일러가 어떤 메소드를 실행할지 주소값을 알고 있으므로, 별도의 과정이 필요 없고 inline으로 빠르게 수행되는 방법<br>

### Dynamic Dispatch
런타임 중에 어떤 메소드를 사용할지 결정하는 방법<br>
런타임 중에 결정되므로 오버헤드가 발생하고 속도가 느리다.<br>
OOP에서 추구하는 패러다임인 다형성(Polymorphism)을 실현할 수 있다.<br>
메소드들은 포인터로 주소값을 가지는데 (V-Table), 런타임 중 어떤 메소드를 실행할지 Dispatch 하는 단계에서 해당 포인터를 찾아가면서 실행할 메소드를 결정하게 된다.<br>

### 예시 - Value Types
```swift
struct Person {
	func getName() -> String { }
}
Extension Person {
	func canJump() -> Bool {}
}
```
값 타입에서는 상속이 불가능하므로, Static dispatch 방법이 사용된다.<br>


### 예시 - Protocol
```swift
protocol Animal {
	func makeNoise() -> String
}
Extension Animal {
	func hasLegs() -> Bool { }
}
```
makeNoise()는 어떤 곳에서 채택하고 있는지를 런타임 중에 확인해야 하므로 Dynamic dispatch 방법이 사용된다.<br>
extension에서는 protocol을 채택하는 곳과 관계없이 모두 동일하므로 Static dispatch 방법이 사용된다.<br>

### 예시 - Class
```swift
Class Dog: Animal {
	func makeNoise() -> String { }
	@objc func sleep() { }
}
extension Dog {
	func canBite() -> Bool { }
}
final class Employee {
	func canCode() -> Bool { }
}
```
makeNoise()는 프로토콜을 채택받아서 사용하는 메소드이므로 Dynamic dispatch 방법이 사용된다.<br>
extension의 경우는 Static dispatch 방법이 사용된다.<br>
상속되지 않는 것이 확실한 곳에서는 static, final을 붙여 명시적으로 Static dispatch를 만들어줄 수 있다.<br>
