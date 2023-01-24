# Input

swift에서의 input은 readLine()을 통하여 진행된다.<br>
반환형은 Optional<String>으로, !를 통하여 강제 unwrapping을 진행해야 한다.
```swift
var value = readLine()
print(value!)
```
### split()
입력값이 하나의 줄에 공백 등의 구분자를 통해 여러 개 들어오는 경우 split()을 통해 값을 쪼개줄 수 있다.
```swift
let input = readLine()!.split(separator: " ")
```
이때 input의 타입은 배열(array)가 된다.
