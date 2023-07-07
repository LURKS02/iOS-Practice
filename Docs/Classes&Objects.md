# Classes & Objects

Objective-C란 객체 지향성이 추가된 C 프로그래밍 언어이다.
<br>
#### Objective-C 특징
- 클래스는 @interface와 @implementation이라는 두 가지 다른 섹션에서 정의된다.
- 객체(수신자)는 메시지를 수신한다.
- 객체는 인스턴스 변수를 포함하며, 객체와 인스턴스 변수에는 범위(Scope)가 존재한다.
- 프로퍼티는 다른 클래스에서 클래스의 인스턴스 변수에 접근하기 위해 사용된다.

<br>

### Objective-C의 구조 형태
1. Program : main함수와 그 외 함수, 시스템 및 외부 연동을 위한 부분
2. Interface : 클래스를 사용하기 위한 외부 연결 선언 부분 (멤버 변수, 메서드의 선언부)
3. Implementation : 메서드의 정의 부분

메서드는 선언/정의 부분이 있는 반면, 멤버 변수는 선언만 있고 정의 부분이 없는 것을 확인할 수 있다.<br>
Objective-C는 기본적으로 main() 함수를 포함하는 main.m 파일이 존재한다. <br>
클래스의 선언과 연결은 .h 파일의 @interface 부분에서 진행되고, 메소드의 정의는 .m 파일의 @implementation 부분에서 진행된다.<br>
이때 main.m에서는 인터페이스만 import 하며, .m 파일에서는 클래스 선언부(인터페이스)를 import 하고, .h 파일에서는 부모클래스의 인터페이스를 import 한다.

<br>

## Class<br>
데이터 유형에 대한 청사진, 즉 사용자 정의 타입으로, 객체 지향 프로그래밍을 지원한다.<br>
객체의 형태를 지정하고 데이터 표현과 해당 데이터를 조작하는 메서드를 하나의 패키지로 결합한다.<br>
모든 클래스는 NSObject라는 베이스 클래스의 파생이며, 이는 모든 Objective-C 클래스의 슈퍼 클래스이다.<br>
인스턴스를 만들기 위한 일종의 틀로, 멤버 변수와 메서드로 구성된다.<br>

#### 인스턴스 (Instance)
클래스를 구체화해서 만든 객체
#### 멤버 변수 (Member)
값을 기억한다.
#### 메서드 (Method)
클래스 또는 인스턴스 내부에서 동작하는 함수로 멤버변수의 값을 이용하여 지정된 동작을 수행한다.<br>
가장 기본적인 메서드로 멤버변수에 값을 설정하거나 참조하는 setter / getter 가 있다.

- 클래스 정의
```objective-c
@interface 인터페이스이름:NSObject {
// 인스턴스 변수
// 비공개(private)로, 클래스 구현 내에서만 접근 가능
}
@property
@end
```
- 메서드 정의
```objective-c
메서드형식 (반환형) 메서드이름: (인수형) 인수이름 파라미터이름: (인수형) 인수이름
```


### NSObject
모든 클래스의 직/간접적 부모 클래스이며, Objective-C의 루트 클래스 역할을 한다.<br>
인스턴스를 생성하고 초기화하는 alloc / init 메서드를 제공한다.<br>
<Foundation/Foundation.h> 파일을 import 해야 한다. 

<br>

### 객체 할당과 초기화<br>
기본적으로 객체는 클래스를 통하여 생성된다.
```objective-c
클래스이름 객체이름 = [[클래스이름 alloc] init];
```
객체의 속성에는 직접 멤버 접근 연산자(.)를 사용하여 접근할 수 있다.

<br>

## Properties<br>
클래스 외부에서 클래스 인스턴스 변수에 접근할 수 있도록 한다.<br>
프로퍼티를 통해야만 클래스 인스턴스 변수에 접근할 수 있으며, 프로퍼티를 위해 내부적으로 getter/setter 메서드가 생성된다.
- 프로퍼티 선언
```objective-c
@property (접근지정자) 데이터유형 프로퍼티이름;
```
- 접근 지정자(access specifiers)<br>
nonatomic/atomic, readwrite/readonly, strong/unsafe_unretained/weak
