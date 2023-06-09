# 캡슐화(Encapsulation)

객체 지향 프로그래밍 개념 중 하나로, 데이터와 데이터를 조작하는 함수를 묶어 외부로부터 보호하는 것을 의미한다.<br>
데이터와 해당 데이터를 이용하는 함수를 번들로 묶는 매커니즘이며, 데이터 은닉(Data Hiding) 개념으로 이어진다.<br>
Objective-C에서는 클래스의 생성을 통해 캡슐화를 지원한다.<br>

#### 데이터 추상화 (Data Abstraction) 
인터페이스만 노출하고 구현에 대한 세부 사항을 사용자로부터 숨기는 매커니즘

```objective-c
@interface Adder: NSObject {
	NSInteger total;
 
	// total 변수는 private 로 선언되어 클래스 외부에서 접근할 수 없다.
	// Adder 클래스의 다른 멤버만이 접근 가능하다.
}

-(id)initWithInitialNumber:(NSInteger)initialNumber;
-(void)addNumber:(NsInteger)newNumber;
-(NSInteger)getTotal;

// 인터페이스 파일 내의 메서드는 공개(public) 범위에 있다.
// 경우에 따라 extension 을 사용하여 private 메서드를 작성할 수도 있다.

@end
```
