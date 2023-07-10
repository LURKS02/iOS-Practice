# Equatable

타입끼리 비교 연산(==)을 위해 필수적으로 구현하게 되는 프로토콜<br>

<br>

### Struct

```swift
struct Human: Equatable {
	var name = ""
	var age = 0
}

let human1 = Human.init()
let human2 = Human.init(name: "", age: 19)

human1 == human2
```
Equatable 프로토콜을 채택하면 인스턴스끼리 비교가 가능하다.<br>
열거형 내 모든 타입이 기본 타입(String, Int 등)일 경우, 직접 == 메서드를 구현해주지 않아도 사용 가능하며, 이 경우 해당 구조체 내의 모든 프로퍼티가 동일해야 true이다.<br>

```swift
struct Human: Equatable {
	var name = ""
	var age = 0

	static func == (lhs: Self, rhs: Self) -> Bool { // 직접 구현
		return lhs.name == rhs.name
	}
}
```
직접 == 메서드를 구현할  경우, 특정 프로퍼티에 대하여 비교하도록 할 수 있다.<br>

<br>

### Class
클래스의 경우 Equtable을 채택한 후, == 메서드를 구현해주어야 한다.<br>
```swift
class Human {
	var name = ""
	var age = 0
}

extension Human: Equatable {
	static func == (lhs: Human, rhs: Human) -> Bool {
		return lhs.name == rhs.name && lhs.age == rhs.age
	}
}

let human1 = Human.init()
let human2 = Human.init()
human2.age = 10

human1 == human2
```

<br>

### Enum
```swift
enum Gender {
	case male
}

let man = Gender.male
let man2 = Gender.male

man == man2
```

연관값이 없는 열거형의 경우 Equatable을 채택하지 않아도 자동으로 구현된다.

<br>

```swift
enum Gender: Equatable {
	case male(name: String)
}

let man = Gender.male(name: "A")
let man2 = Gender.male(name: "B")

man == man2
```

연관값이 있는 열거형의 경우 Equatable을 채택해주면 자동으로 구현된다.<br>
