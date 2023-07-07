# Extension

클래스 extension 은 클래스가 컴파일 될 때 함께 컴파일되므로, 컴파일 시간에 소스를 가지고 있는 클래스에만 추가가 가능하다.<br>
클래스 extension 에서 선언된 메서드는 원본 클래스의 implementation 블록에서 구현되므로, NSString 같은 Cocoa / Cocoa Touch class 같은 프레임워크 클래스에는 extension 을 사용할 수 없다.<br>
extension 은 사실상 이름 없는 카테고리로, 종종 anonymous categories 로 참조된다.<br>

#### extension  구문
```objective-c
@interface ClassName ()

@end
```

#### extension 특징
- extension 은 모든 클래스에 대하여 선언이 가능하지는 않고, 소스 코드에 대한 original implementation 이 존재하는 클래스에만 선언 가능하다.
- extension 은 해당 클래스에만 특정한 private 변수 및 메서드를 추가한다.
- extension 으로 선언된 변수 및 메서드는 상속 클래스에서도 접근이 불가능하다.

<br>

#### Class Extension과 Category의 차이점
##### 1. Class Extension<br>
클래스의 기능을 확장하며, 주로 비공개 메서드 & 프로퍼티를 추가하는 데 사용된다.<br>
@implementation 블록과 같은 파일에서 선언되어야 하며, 다른 곳에서는 접근할 수 없다.<br>
원래의 클래스에 새로운 속성 & 메서드를 추가하며, 이들은 컴파일 타임에 추가된다.<br>
주로 해당 클래스의 메인 구현 파일(‘.m’ 파일)에 선언되는 비공개 인터페이스로 쓰이며, 클래스의 “비공개” 부분을 선언하는 데 사용된다.<br>
```objective-c
@interface MyClass ()
// 비공개 메서드 및 프로퍼티 선언
@end
```

##### 2. Category<br>
클래스의 기능을 확장하며, 주로 공개 메서드를 추가하는 데 사용된다.<br>
@implementation 블록과 별도의 파일에서 선언될 수 있으며, 다른 곳에서도 접근이 가능하다.<br>
원래의 클래스에 메서드만 추가할 수 있다.<br>
원래 클래스의 메인 구현 파일 뿐 아니라 다른 파일에서도 선언이 가능하며, 주로 클래스의 “공개” 부분을 확장하는 데 사용된다. <br>
```objective-c
@interface MyClass (MyCategory)
// 공개 메서드 선언
@end
```
