# Text with different color

하나의 text view 내에서 여러 개의 색상을 사용할 수 있다.

<img width="271" alt="스크린샷 2023-01-10 오전 10 35 31" src="https://user-images.githubusercontent.com/63408930/211441925-ffba9791-c073-4e23-aa48-ba9a553f4a32.png">

```swift
Text("I agree with [Terms & Use](link1) and [Privacy Policy](link2)")
  .foregroundColor(.gray)
  .tint(.blue)
```
