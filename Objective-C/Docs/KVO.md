# KVO

### KVO(Key-Value Observing)
다른 객체의 특정 프로퍼티에 대한 변경 사항을 알림 받을 수 있는 매커니즘<br>
Model과 View같이 논리적으로 분리된 파트 간의 변경사항을 전달하는데 유용하다.<br>
NSObject를 상속받는 객체에서만 사용이 가능하며, dealloc 시 옵저버를 지워주어야 한다.<br>

### KVO의 특징
Swift의 willSet, didSet의 프로퍼티 옵저버와는 다르게 class 내부에 구현하지 않고 (내부 코드를 건드리지 않고) 외부에서 해당 값의 변화를 관찰해서 동작하는 것이 가능하다.<br>
외부 라이브러리 또는 SDK를 이용하는 내부 코드를 건드리지 않고, 내부에 NSObject를 상속받아 외부에서 이를 관찰하여 원하는 동작을 설계하는 것이 용이하다.<br>
일반적인 옵저버 패턴이지만, 키를 String으로 넣기 때문에 변수명이 변경되면 수정이 필요하다.<br>

### KVO in Objective-C 
#### 선언
```objective-c
[self.child1 addObserver: self
	forKeyPath:@“name”
	options: 0
	context: nil];
```

#### 해제
```objective-c
[self.child1 removeObserver:self forKeyPath: @“name”];
```

#### 값의 변화
```objective-c
[self.chlid1 setValue:@“Kim” forKey:@“name”];
```
private 변수를 선언하여 사용하는 경우, KVC의 setValue를 이용하여 값을 변경하고 이를 감시한다.<br>

#### 값의 감시
```objective-c
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
	if ([keyPath isEqualToString:@“name”]) {
	}
	if (keyPath isEqualToString: @“age”]) {
	}
}
```

#### 감시 금지
```objective-c
+ (BOOL) automaticallyNotifiesObserversForKey: (NSString *)key {
	if ([key isEqualToString: @“address”]) {
		return NO;
	} else {
		return [super automaticallyNotifiesObserversForKey: key];
	}
}
```

### KVO in Swift

```swift
class Person: NSObject {
	let name: String
	@objc dynamic var age: Int // observer하려는 프로퍼티

	init (name: String, age: Int) {
		self.name = name
		self.age = age
	}
}
```

```swift
var person = Person(name: “Kim”, age: 20)

person.observe(\.age, options: [.old, .new]) { (object, change) in
}
```
