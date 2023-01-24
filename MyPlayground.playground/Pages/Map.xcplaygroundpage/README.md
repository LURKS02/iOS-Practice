# Map

map은 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과값을 다시 반환해주는 함수이다.<br>
map을 사용하여도 기존의 컨테이너 값은 변경되지 않고 새로운 컨테이너가 생성된다.<br>
```swift
let nums: [Int] = [0, 2, 4, 6, 8]
let multiplyTwo: (Int) -> Int = { $0 * 2 }
let doubleNums = nums.map(multiplyTwo)
```
입력값을 숫자열 배열로 저장하려면 다음과 같은 코드를 작성한다.
```swift
let inputArray = readLine()!.split(separator: " ").map{Int($0)!}
```

### enumerated()
쌍의 시퀀스(n,x)를 반환해주는 메서드<br>
 > n : 0에서 시작하는 연속적인 정수
 > x : 시퀀스의 요소
'''swift
array.enumerated().map { index, val in
  String(val - input[index])
'''
