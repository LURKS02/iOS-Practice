# KVC

### KVC (Key-Value Coding)
객체의 값을 직접 가져오지 않고, Key / KeyPath를 이용해서 간접적으로 데이터를 가져오거나 수정하는 방법<br>
key는 일반적으로 객체에 정의된 accessor method 또는 인스턴스 변수의 이름이다.<br>
key는 ASCII로 인코딩되고, 소문자로 시작해야하며 공백이 없어야한다.<br>

<br>

### Objective-C에서의 접근

```objective-c
// String key를 이용하여 프로퍼티에 접근
Id address = [person valueForKey:@“address”];
Id town = [address valeuForKey:@“town”];
// KeyPath를 통하여 접근
Id town = [person valueForKeyPath:@“address.town];
```
KVC는 NSKeyValueCoding이라는 protocol을 사용하며, 해당 프로토콜은 접근자 getter & setter를 제공한다.<br>
1. getter Method
- valueForKey:
- valueForKeyPath
2. setter Method 
- setValue:forKey:
- setValue:forKeyPath

<br>

### Swift에서의 접근

```swift
struct Address {
	var town: String
}

struct Person {
	var address: Address
}

let address = Address(town: “예시”)
let kim  = Person(address: address)

let kimAddress = kim[keyPath: \.address]
let kimTown = kim[keyPath: \.address.town]
kim[keyPath: \.addresss.town] = “예시2”
```

<br>

### KeyPath의 Syntax
```swift
\베이스타입.프로퍼티이름
```

<br>

### KeyPath의 종류
- AnyKeyPath : 타입이 지워진 KeyPath
- PattialKeyPath<Base> : 부분적으로 타입이 지워진 KeyPath
- KeyPath<Base, Property> : Read-only
- WritableKeyPath<Base, Property> : value type 인스턴스에 사용 가능하며, 변경 가능한 모든 프로퍼티에 대한 read & write access 제공
- ReferenceWritableKeyPath<Base, Property> : 클래스의 인스턴스에 사용 가능하며, 변경 가능한 모든 프로퍼티에 대한 read & write access 제공

KeyPath를 만들 때, 대상이 let이라면 자동으로 KeyPath 타입, var라면 자동으로 WritableKeyPath 타입이 들어간다.<br>
Struct(value type)가 아니라 Class(reference type)라면 KeyPath는 자동으로 ReferenceWritableKeyPath 타입이 된다.<br>

<br>

### KeyPath의 특징
클래스 간 의존성을 낮출 수 있으나, 상대 클래스를 직접 호출하는 것이 아니므로 가독성이 떨어질 수 있다.<br>

```objective-c
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
	UIViewController *destination = segue.destinationViewController;
	if ([destination respondsToSelector:@selector(setDelegate:)]) {
		[destination setValue:self forKey:@“delegate”]; //KVC
	}
}

// 해당 코드를 직접 메서드 호출하게 된다면, import와 캐스팅을 필수적으로 진행해야 한다.
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	BIDTaskDetailController *destination = (BIDTaskDetailController *)segue.destinationViewController;
	if (destination != nil) {
		destination.delegate = self;
	}
}
```

