# Property

값을 특정 클래스(Class), 구조체(Struct), 열거형(Enum)과 연결<br>

### 저장 프로퍼티(Stored Property)
상수와 변수 값을 인스턴스의 일부로 저장하며, 클래스와 구조체에서 사용된다.<br>
```swift
struct FixedLengthRange {
	// 저장 프로퍼티
	var firstValue: Int
	let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
}
```

<br>

### 게으른 저장 프로퍼티 (Lazy Stored Property)
값이 사용되기 전까지 값이 계산되지 않는 프로퍼티<br>
인스턴스가 초기화 될 때까지 값을 알 수 없는 외부적인 요소에 초기값을 의존해야 하는 경우와, 초기값이 복잡하거나 계산 비용이 많이 드는 설정이 필요한 경우 유용하다.<br>
lazy 프로퍼티는 항상 변수로서 선언해야 하며, lazy 프로퍼티가 초기화되지 않은 상태에서는 여러 쓰레드가 동시에 해당 프로퍼티에 엑세스한다면, 해당 프로퍼티가 단 한번만 초기화된다는 것을 보장할 수 없다.<br>

```swift
class DataImporter {
	var fileName = "data.txt"
}

class DataManager {
	lazy var importer = DataImporter()
	var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
// importer 프로퍼티는 생성되지 않음
```
위와 같은 경우, importer 프로퍼티는 해당 프로퍼티에 처음 엑세스할 때 생성된다.<br>
```swift
print(manager.importer.fileName)
```

<br>

### 연산 프로퍼티(Computed Property)
특정 연산을 수행하여 값을 반환하며, 클래스, 구조체와 열거형에서 사용된다.<br>

<br>

### 타입 프로퍼티(Type Property)
프로퍼티를 타입 자체와 연결할 수 있다.<br>

