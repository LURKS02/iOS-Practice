# 싱글턴 패턴 (Singleton Pattern)

특정 클래스의 인스턴스가 하나만 존재하도록 보장하며, 인스턴스에 대한 전역 접근을 제공하는 패턴<br>
한 클래스의 인스턴스를 전역에서 접근하고 사용할 수 있어 데이터 공유 / 설정 관리 / 풀링 / 로깅 등의 목적으로 사용된다.<br>

### 특징
- 클래스 자신이 유일한 인스턴스를 유지한다.
- 전역적으로 인스턴스에 접근할 수 있는 방법을 제공한다. (getInstance / sharedInstance 등의 메서드)
- 인스턴스를 직접 생성할 수 없도록 생성자를 private로 선언한다.

```objective-c
+ (instancetype) sharedInstance {
	static id sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}
```
