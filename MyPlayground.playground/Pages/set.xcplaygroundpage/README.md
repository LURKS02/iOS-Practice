# Set

컬렉션 타입으로, 순서가 없고 유일 멤버를 가진다.
```swift
var ints: Set<Int> = Set<Int>()
```

<br>

1. 삽입
```swift
ints.insert(1)
ints.insert(2)
ints.insert(2)
//중복 불가
```
2. 제거
```swift
ints.remove(1)
ints.removeFirst() //첫번째 값 제거
```
3. 포함 여부
```swift
if ints.contains(1) {
}
```
4. empty 여부
```swift
if ints.isEmpty {
}
```
<img width="700" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbvqYxv%2Fbtq9x6DIlWl%2FsjGx51XBid2uZaEbUGkJs0%2Fimg.png" alt="사진">

```swift
var ints1: Set = [1, 2, 3]
var ints2: Set = [1, 3, 4]
```

5. 합집합
```swift
ints1.union(ints2).sorted()
```
6. 교집합
```swift
ints1.intersection(ints2).sorted()
```
7. 차집합
```swift
ints1.subtracting(ints2).sorted()
```
8. 대칭차집합
```swift
ints1.symmetricDifference(ints2).sorted()
```



