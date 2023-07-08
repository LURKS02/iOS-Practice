# map

### map

배열 내부의 값을 하나씩 mapping하는 개념<br>
각 요소에 대한 값을 변경하고자 할 때 사용하며, 결과를 배열 상태로 반환한다.<br>

```swift
func map<T>(_ transform: (String) throws -> T) rethrows -> [T]
```

<br>

### flatMap
주어진 시퀀스의 각 요소에 대해 변환 함수를 적용한 뒤 결과를 하나의 배열로 합쳐서 반환하는 것<br>
시퀀스의 요소를 인자로 받아 시퀀스 또는 컬렉션을 반환하는 클로저인 transform을 인자로 받는다.<br>

```swift
func flatMap<SegmentOfResult>(_ transform: (Self.Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element] where SegmentOfResult : Sequence
```

변환 함수가 각 요소에 대해서 시퀀스 또는 컬렉션을 반환하는 경우, 이 메서드를 사용하면 단일 레벨의 컬렉션을 받을 수 있다.<br>
```swift
let numbers = [1, 2, 3, 4]

let mapped = numbers.map { Array(repeating: $0, count: $0) }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) }
// [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
```

<br>

### compactMap
시퀀스의 각 요소에 대해서 주어진 변환 함수를 호출한 결과 중 nil이 아닌 결과만을 포함하는 배열을 반환하는 것<br>
시퀀스의 요소를 인자로 받아 옵셔널 값을 반환하는 클로저인 transform을 인자로 받는다.<br>
시퀀스의 각 요소에 대하여 transform을 호출한 non-nil인 결과들의 배열을 반환한다.<br>

```swift
func compactMap<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]
```

변환 함수가 옵셔널 값을 생성하는 경우, 이 메서드를 사용하여 non-optional 값들의 배열을 얻을 수 있다.<br>
```swift
let possibleNumbers = ["1", "2", "three", "///4///", "5"]

let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
// [1, 2, nil, nil, 5]

let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
// [1, 2, 5]
```
