# 메서드 (Method)

### 메서드 용어
> 셀렉터(Selector) : 메서드 이름<br>
> 메시지(Message) : 메서드와 인수가 합쳐진 상태, 메시지를 수신하는 객체는 수신자, 리시버(Receiver)라고 한다.<br>
> 시그니처(Signature) : 메서드의 반환형과 인수의 정의

### Objective-C에서의 반환 형식
Objective-C에서 메서드는 포인터 주소인 id를 반환하며, 이 값은 현재 인스턴스 포인터 주소인 self를 의미한다.<br>
메서드 선언/정의 시 반환형을 생략하면 자동으로 id 형식 포인터가 반환된다.<br>
```objective-c
// 아래의 메서드 선언은 동일하게 해석된다.
-initWithFraction:f;
-(id)initWithFraction:(id)f;
```
따라서 다음과 같은 중첩된 메시지 전송이 가능하다.
```objective-c
obj = [[[MyClass alloc] init] setChild: subObj];
```


#### Instance Method
- -로 시작
- 메시지 리시버가 객체
- 클래스 멤버 변수에 접근 가능하다.
- 메시지 리시버가 객체이므로 객체 선언 및 초기화가 필요하다.

```objective-c
// 선언 예시
-(void)my_method;


// 사용 예시
Test *ins = [[Test alloc] init];
[ins my_method];
```

#### Class Method
- +로 시작
- 메시지 리시버가 클래스
- 클래스 멤버 변수에 접근이 불가능하다.
- 메시지 리시버가 클래스이므로 객체 선언과 초기화 없이 클래스명으로 호출이 가능하다.

```objective-c
// 선언 예시
+(void)my_method;

//사용 예시
[Test my_method];
```
