# Filter

주어진 콜렉션에서 특정 조건의 원소만 걸러서 반환해주는 함수
```swift
func filter(includeElement: (T) -> Bool) -> Array<T>
```
### 사용 예시
```swift
let oddArray = array.filter({(value: Int) -> Bool in return (value % 2 == 0)})
```
```swift
let filteredItems = files.filter{$0.hasSuffix(".md")}
```
