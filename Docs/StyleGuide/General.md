# Objective-C 코딩 가이드라인 (Apple)
Apple의 "Coding Guidelines for Cocoa"에 의거하여 정리된 Objective-C 코딩 가이드라인입니다.<br>


## 목차
- Code Naming Basics
  - General Principles
  - 


## Code Naming Basics
### General Principles

#### - 명확성(Clarity)
가능한 한 명확하고 간결하게 표현하는 것이 좋지만, 간결함 때문에 명확성을 잃어서는 안된다.<br>

##### 좋은 예
```objective-c
insertObject: atIndex:

removeObjectAtIndex:

removeObject: // argument로 전달된 요소를 제거하기 때문에 Good
```

##### 나쁜 예
```objective-c
insert: at: // 무엇이 어디에 insert되는지 명확하지 않음

remove: // 무엇이 지워지는지 명확하지 않음
```

<br>

일반적으로 사물의 이름은 축약하지 않고, 길어지더라도 그대로 작성한다.<br>

##### 좋은 예
```objective-c
destinationSelection

setBackgroundColor:
```

##### 나쁜 예
```objective-c
destSel

setBkgdColor:
```

<br>

일부 약어는 실제로 많이 사용되고 오랫동안 사용해온 기록이 있으므로, 계속 사용할 수도 있다.<br>
여러 방식으로 사용될 수 있는 API 이름(Ex. 메서드 이름)은 모호성을 피해야 한다.<br>

```objective-c
sendPort // port를 전송(send)하는 것인지 반환(return)하는 것인지 명확하지 않다.

displayName // 이름을 표시(display)하는 것인지 사용자 인터페이스에서 수신자의 제목을 반환(return)하는 것인지 명확하지 않다.
```

<br>

#### - 일관성(Consistency)
Cocoa 프로그래밍 인터페이스 전체에서 일관된 naming을 사용해야 한다.<br>
확실하지 않을 때는 헤더 파일이나 참조 문서를 참고한다.<br>
이는 특히 다형성(polymorphism)을 활용해야 하는 메서드를 가진 클래스의 경우 매우 중요하다.<br>
서로 다른 클래스에서 동일한 작업을 수행하는 메서드는 동일한 이름을 가져야 한다.<br>

```objective-c
- (NSInteger) tag // NSView, NSCell, NSControl 에도 정의되어 있다.

- (void) setStringValue: (NSString *) // 다양한 Cocoa class에서 정의되어 있다.
```

<br>

#### - No Self Reference
이름은 자기 참조적 (self-referential)이어서는 안된다.<br>

##### 좋은 예
```objective-c
NSString
```

##### 나쁜 예
```objective-c
NSStringObject // self-referential
```

<br>

단, 비트 연산에서 결합될 수 있는 마스크 상수 또는 알림 이름과 같은 상수는 예외로 한다.<br>

##### 예시
```objective-c
NSUnderlineByWordMask

NSTableViewColumnDidMoveNotification
```
<br>

### Prefixes

접두사는 프로그래밍 인터페이스에서 이름상 중요한 부분으로, 소프트웨어의 기능적인 영역을 구분짓는 역할을 한다.<br>
일반적으로 이러한 소프트웨어는 프레임워크로 제공되거나, 밀접한 관련이 있는 프레임워크에 포함된다. (Ex. Foundation 및 Application Kit)<br>
접두사는 third-party 개발자가 정의한 symbol과 Apple에서 정의된 symbol 간, 그리고Apple 자체 프레임워크 내에서의 충돌을 방지하는 역할을 한다.<br>

<br>

접두사는 규정된 형식을 따르며, 대문자로 구성된 2~3개의 글자로 이루어져 있다.<br>
밑줄 또는 하위 접두사를 허용하지 않는다.<br>

##### 예시

```objective-c
NS // Foundation
NS // Application Kit
AB // Address Book
IB // Interface Builder
```
Typedef 구조체, 클래스, 프로토콜, 함수, 상수를 명명할 때 접두사를 사용한다.<br>
단, 메서드는 해당 메서드를 정의한 클래스에 의해서 생성된 이름 공간에 존재하므로, 메서드를 명명할 때는 접두사를 사용하지 않는다.<br>
또한, 구조체의 field를 명명할 때도 접두사를 사용하지 않는다.<br>
