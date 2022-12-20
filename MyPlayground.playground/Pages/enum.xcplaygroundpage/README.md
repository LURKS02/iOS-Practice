# Enum

- Enum : 유사한 값들을 묶어서 객체화하는 데이터 타입

```swift
enum Bootcamp {
  case iosCamp
  case androidCamp
  case webCamp
}

var camp = Bootcamp.webCamp
camp = .iosCamp
```
각 열거형은 고유 타입으로 인정된다.
이는 예상된 입력 값이 정해져 있거나, 정해진 값 외에는 입력받지 않을 경우에 유용하다.

```swift
enum grade : Int {
  case first = 1
  case second = 2
  case third
  }

print(grade.third.rawValue = \(grade.third.rawValue)")
```
rawValue를 이용하여 내부값을 출력할 수 있다.
이때 자동으로 1이 증가된 값이 할당된다.

