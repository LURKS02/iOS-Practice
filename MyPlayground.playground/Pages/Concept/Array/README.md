# Array

일련의 값들을 연속적이 저장 공간에 차례로 배치하여 저장한다.

```swift
//배열을 생성하는 구문
var arr1 = Array<Int>()
var arr2: Array<Int> = Array()
var arr3 = [Int]()
var arr4: [Int] = []

//배열 리터럴
let arr5 = [1, 2, 3, 4, 5]
let arr6 = Array(arrayLiteral: 1, 2, 3, 4, 5)
```

### 원소 정렬
```swift
arr.sort()
arr.sort(by: >) //내림차순

arr.sorted()
```
sorted() 메서드는 정렬된 배열을 다시 리턴해주고, 배열 자체는 정렬하지 않는다.<br>
