
# 상속(Inheritance)

객체 지향 프로그래밍에서 가장 중요한 개념 중 하나이다.<br>
다른 클래스를 기반으로 클래스를 정의할 수 있다.<br>
코드 기능을 재사용하고 빠르게 구현할 수 있다.<br>
파생 클래스(derived class)가 기반 클래스(base class)의 멤버를 상속받는다.<br>
상속 개념은 IS 관계를 구현한다.<br>

### Base & Derived Class
Objective-C에서는 기본적으로 하나의 base class만을 가지며, 다중 수준의 상속이 허용된다.<br>
Objective-C의 모든 클래스는 슈퍼 클래스 NSObject에서 파생된다.<br>
- 클래스 상속 표현
```objective-c
@interface 파생클래스: 기반클래스
```

### 접근성
파생 클래스는 interface 에서 정의된 기반 클래스의 모든 private 멤버에 접근할 수 있다.<br>
Implementation 에서 정의된 비공개 멤버에는 접근할 수 없다.<br>
#### 엑세스 유형
- Public : 모든 클래스에서 접근 가능
- Protected : 자체 및 파생 클래스에서 접근 가능
- Private : 자체 클래스에서만 엑세스 가능

파생 클래스는 기반 클래스의 모든 변수와 메서드를 상속받는다.<br>
#### 상속 예외
- Implementation 에서 extension 을 통하여 선언된 메서드 및 변수
- 파생 클래스에서 기반 클래스의 메서드를 구현한 경우, 파생 클래스의 메서드가 실행됨
