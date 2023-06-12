# Getter & Setter

#### getter
멤버 변수의 값을 반환하는 함수<br>
인수가 필요 없고 멤버 변수의 형식을 그대로 함수의 반환 형식으로 사용한다.<br>
getter의 이름은 단순히 멤버 변수 이름으로 만들어진다.

<br>

#### setter
멤버 변수의 값을 설정하는 함수<br>
하나의 인수를 사용하고 인수의 형식은 멤버 변수의 형식을 그대로 사용한다.<br>
반환값이 없으므로 형식은 언제나 void이다.<br>
setter의 이름은 set + 멤버 변수 이름으로 만들어진다.

<br>
Ex) 멤버 변수 num의 getter/setter 메소드는 num / setNum 으로 생성된다.

### getter & setter 자동 생성
컴파일러 지시자 @property를 통하여 getter/setter를 자동으로 생성할 수 있다.<br>
이때 dot연산자를 활용하여 가독성을 높일 수 있다.
```objective-c
@property (readwrite) int num;
```
옵션 (readwrite)를 통하여 읽기/쓰기가 가능한 getter/setter를 모두 생성한다.
```objective-c
@synthesize num;
```
@synthesize 구문은 @property에 의해 생성된 자동 변수를 인스턴스 변수와 동기화시킨다.<br>

#### @property 구문에 사용할 수 있는 옵션
> getter/setter=[메서드 이름] : getter/setter 메서드 이름을 별도로 지정
> readonly : 읽기 전용, getter만 생성
> readwrite : 읽기/쓰기 전용, getter/setter 모두 생성, 기본값
> assign : 값을 복사 설정, 기본값
> retain : 멤버변수가 인스턴스 포인터 값을 가질 때, 오너십을 위해 retain 증가
> copy : 멤버변수가 인스턴스 포인터 값을 가질 때, 인스턴스 복사
> atomic : getter/setter는 선형 스레드를 통해 독립 실행
> nonatomic : getter/setter는 다중 스레드를 통해 동시 실행 가능
