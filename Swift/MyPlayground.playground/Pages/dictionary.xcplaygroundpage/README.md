# Dictionary

- 딕셔너리(dictionary)

요소들의 키와 값의 쌍을 이루는 컬렉션 타입<br>
딕셔너리는 정해진 순서가 없다. (정렬시 sorted 이용)

```swift
var dic: [Int: String] = [:]
var dic = [:]
var dic: Dictionary = [:]
var dic: Dictionary<Int, String> = [:]
```
값 수정시 
> ```swift
> dictionary.updateValue(변경값, forKey: 키값)
> ```

값 삭제시
> ```swift
> dictionary.removeValue(forKey: 키값)
> ```

key 값들을 얻어오는 경우
> ```swift
> dictionary.keys
> ```

value 값들을 얻어오는 경우
> ```swift
> dictionary.values
> ```

키로 저장된 값이 없다면 default값을 가져오도록 함
> ```swift
> dictionary[없는키, default: 주는값]
> ```
