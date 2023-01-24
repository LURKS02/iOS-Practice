# Input

swift에서의 input은 readLine()을 통하여 진행된다.<br>
반환형은 Optional<String>으로, !를 통하여 강제 unwrapping을 진행해야 한다.
```swift
var value = readLine()
print(value!)
```
