# Enum (Enumeration)

열거형 데이터 그룹으로, 관련되어 있는 값들의 그룹<br>
case 키워드를 사용하여 열거형의 각각의 값을 나타낸다.<br>
View의 상태를 표현하거나, 사용자 인터페이스의 다양한 옵션을 정의하는데 사용된다.<br>


### 선언

```swift
enum EnumName {
	case case1
	case case2
	// ...
}
```


### 사용
```swift
func changeEnumeration(_ element: inout Company) { // inout으로 주소값에 접근
	switch element {
	
	case .Apple:
		element = .Samsung
	case .Samsung:
		element = .Apple
	case .Google:
		element = .Naver
	case .Naver:
		element = .Google
	}
}

changeEnumeration(&koreaCompany)
```

### Enum의 값 할당

```swift
enum Language {
	case Programming(String)
	case Life(String)
}

var language = Language.Programming("IOS") // 값 할당

switch language {
	case .Programming(let word):
		word
	case .Life(let word):
		word
}
```

### RawValue와 함수

```swift
enum Friend: String {
	case Steven = "IOS Developer"
	case Ruel = "Singer"
	case Hachimula = "Basketball Player"
	// case에 값을 할당하여 사용, 상속 필요

	func BestFriend() {
		switch self {
		case .Steven:
		default:
		}
	}
}

let myFriend = Friend.Hachimula
myFriend.rawValue
myFriend.BestFriend()
```
