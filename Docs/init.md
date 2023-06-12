# init

각 클래스는 새로운 인스턴스를 생성하면 바로 초기화 작업을 진행한다.<br>
모든 클래스는 고유의 멤버 영역이 있으며, 이를 초기화하기 위해 고유의 초기화 메서드가 오버라이드 되어야한다.<br>

### 재정의(override)
설계하는 새로운 클래스에 맞게 메서드를 다시 정의하는 과정<br>
부모 클래스에서 정의된 메서드를 자식 클래스에서 다시 정의하는 작업<br>

### init 메서드의 기본 형식
```objective-c
-(id)init
{
	self = [super init];
	if (self != nil)
		{
			…
		}
	return self;
}
```
부모클래스의 init 메서드를 호출하여 슈퍼클래스 초기화에 성공하면 사용자가 지정한 현재 클래스의 초기화 작업을 진행한다.

<br>

### 초기화 규칙

> 각 클래스의 지정초기화는 상위 클래스의 지정초기화를 호출하며, 각 클래스의 보조초기화는 자기 클래스의 지정초기화를 호출한다.<br>

- 지정초기화(designated initializer)
객체를 완전히 초기화하는 주요 초기화 메서드로, 모든 인스턴스 변수를 설정하고 초기 상태를 구축하는 역할을 가진다.<br>

- 보조초기화(secondary initializer)
객체를 초기화하는 보조적인 역할을 수행하는 초기화 메서드로, 초기화 작업을 직접 수행하기보다는 최종적으로 지정초기화 메서드를 호출하여 초기화 작업을 진행한다.<br>

#### 초기화 규칙 예시
```objective-c
@interface Volume: NSObject {
	int val;
	int min, max, step;
}
-(id)initWithMin: (int)a max: (int)b step: (int)s;
-(id)init;
@end

@implementation Volume

// 지정초기화
-(id)initWithMin: (int)a max: (int)b step: (int)s {
	self = [super init];
	if (self != nil) {
		val = min = a;
		max = b;
		step = s;
	}
	return self;
}

//보조초기화
-(id)init {
	self = [self initWithMin: 0 max: 10 step: 1];
	return self;
}
@end


@interface ChildVolume: Volume
-(id) initWithMin: (int)a max: (int)b step: (int)s;
@end 

@implementation ChildVolume
-(id) initWithMin: (int)a max: (int)b step: (int)s {
	self = [super init];
	return self;
}
@end


Int main(int argc, char *argv[]) {
	ChildVolume *p = [[ChildVolume alloc] initWithMin: 0 max: 5 step: 1];
	[p release];
	return 0;
}
```
다음 코드에서 ChildVolume의 인스턴스 초기화를 위하여 지정초기화를 호출하면 부모클래스 Volume의 init을 호출하게 되면서, 실제 self는 ChildVolume으로 다시 ChildVolume의 지정초기화를 호출한다.<br>
이러한 과정을 통하여 무한루프가 형성되고, Stack Overflow가 발생한다.

 
