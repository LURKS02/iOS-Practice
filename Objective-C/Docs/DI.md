# DI (Dependency Injection)

### DI (Dependency Injection, 의존성 주입)
객체 간의 의존 관계를 외부에서 관리하고 제공하는 방법<br>
의존성을 직접 관리하는 대신, 객체가 필요로 하는 의존성을 외부에서 주입하는 방식이다.<br>

### 장점

##### 1. 느슨한 결합
의존성을 외부에서 주입함으로써 객체 간의 결합도를 낮춘다.<br>
객체는 구체적인 의존성을 알 필요 없이 인터페이스에 의존할 수 있고, 유연성과 유지보수성을 향상시킬 수 있다.<br>

##### 2. 테스트 용이성
테스트 중에 모의 객체(mock object) 또는 대체 구현을 주입할 수 있다.<br>
의존성을 제어하여 테스트하기 쉽고 격리된 환경에서 객체를 테스트할 수 있다.<br>

##### 3. 재사용성
객체는 외부에서 의존성을 주입받으므로 재사용 가능한 구성 요소가 된다.<br>
다른 의존성을 주입하면 동일한 객체를 여러 상황에서 재사용할 수 있다.<br>

<br>

### 구현 방법

##### 1. 생성자 주입(Constructor Injection)
객체 생성 시 의존성을 주입한다.<br>
생성자를 통해 필요한 의존성을 전달하여 객체를 초기화한다.<br>

##### 2. 세터 주입(Setter Injection)
세터 메서드를 사용하여 의존성을 주입한다.<br>
의존성을 설정하기 위해 객체의 세터 메서드를 호출한다.<br>

##### 3. 인터페이스 주입(Interface Injection)
의존성을 주입하기 위해 인터페이스를 사용한다.<br>
객체는 특정 인터페이스를 구현하고, 해당 인터페이스를 통해 의존성을 주입받는다.<br>

<br>

### 예시 코드
```objective-c
@protocol LoggerProtocol
- (void)logMessage: (NSString*) message;
@end

@interface MyClass: NSObject
@property (nonatomic, strong) id<LoggerProtocol> logger;

- (void)doSomething;
@end

@implementation MyClass
- (void)doSomething {
	[self.logger logMessage: @“Something happened.”]’
}
@end

@interface ConsoleLogger: NSObject <LoggerProtocol>
@end

@implementation ConsoleLogger
- (void)logMessage: (NSString*) message {
	NSLog(@“%@“, message);
}
@end

ConsoleLogger *logger = [[ConsoleLogger alloc] init];
MyClass *myObject = [[MyClass alloc] init];
[myObject setLogger: logger];
[myObject doSomething];
```


