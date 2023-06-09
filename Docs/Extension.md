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
