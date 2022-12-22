# For-in과 For-each

- For 반복문
```swift
for _ in 0...5  //0부터 5까지(포함)
```
```swift
for _ in 0..<5  //0부터 5 전까지(미포함)
```

- For-in : 컬렉션에 저장된 요소 수만큼 반복하며, 저장된 요소가 루프 상수에 하나씩 들어간다.

```swift
let nums : [Int] = [1, 2, 3, 4]

for num in nums {
  print(num)
}
//1 2 3 4
//nums 내부에 있는 num을 차례로 출력한다.
```

- For-each : 반복 실행하려는 코드를 파라미터로 받고, 저장된 요소는 클로저 상수로 전달된다.
```swift
let nums : [Int] = [1, 2, 3, 4]

nums.forEach {
  print($0)
}
//1 2 3 4 
```
