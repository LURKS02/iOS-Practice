# 속성(Property)

## @property
접근자 메서드 (getter / setter)를 자동으로 생성해주는 지시어<br>
@property는 @interface부분과 연결되고, @synthesize / @dynamic 은 @implementation 부분과 연결된다.<br>
@property 및 @synthesize는 preprocessor macro로서 빌드 후 실행했을 때 prewritten / preformatted 코드블락으로 교체된다.<br> 
Objective-C에서는 인스턴스 객체 속성에 접근할 때 변수에 접근하는 메서드를 정의하여 사용한다.<br>

```objective-c
@interface Example: NSObject
{
	float value;
}
- (float)value;
- (void)setValue: (float)newValue;

// 동일

@interface Example: NSObject
{
	float value;
}
@property float value;
```

<br>

## @synthesize
@property 에서 프로퍼티들에 대한 getter / setter를 선언한 후 @implementation에서 실제 코드를 추가해주어야 함.<br>
@property는 컴파일러가 @implementation에서 getter / setter 메서드가 작성되었다는 것을 기대하게 하는 역할이므로 실제 구현 코드가 필요하다.<br>

```objective-c
@implementation Example
- (float) value
{
	return value;
}
- (void)setValue: (float)newValue
{
	value = newValue;
}
@end

// 동일

@implementation Example
@synthesize value;
@end
```

<br>

## @dynamic
@synthesize 대신 사용할 수 있으며, getter / setter 가 클래스 자신에 의하여 구현되지 않고 다른 어딘가(슈퍼 클래스 등)에 구현되어 있다고 알려주는 역할을 한다.<br>
getter / setter 가 구현되어 있지 않아도 컴파일러 경고를 받지 않을 수 있다.<br>
구현 책임이 delegate 되었음을 나타내거나, 접근자 메서드들이 컴파일 타임이 아니라 런타임 시에 제공되는 경우(Ex. CoreData의 NSManagedObject)에도 컴파일 타임에 오류가 나지 않도록 할 수 있다.<br>

```objective-c
// 슈퍼 클래스
@property (nonatomic, retain) NSButton *someButton;
@synthesize someButton;

// 자식 클래스
@property (nonatomic, retain) IBOutlet NSButton *someButton;
@dynamic someButton;
```

<br>

## 사용 가능한 속성
- getter=getterName : getter의 이름을 getterName으로 지정한다.
- setter=setterName : setter의 이름을 setterName으로 지정한다.
- readwrite : 기본 동작으로 getter / setter를 모두 만든다.
- readonly : getter만 생성한다.
- assign : 기본 동작으로 setter가 간단한 할당을 사용(Ex. location = where) 한다. 객체를 소요할 필요가 없을 때 사용한다.
- retain : reference count를 증가시킨다. 포인터 객체를 할당할 경우 외부에서 객체가 릴리즈되어 파괴된 객체를 참조하는 문제를 막기 위하여 클래스가 멤버 객체를 소유하도록 reference count 를 증가시킨다. (이전 값 release)
- copy : 할당하는데 객체의 복사본을 사용한다. 포인터 객체의 경우 reference의 값이 바뀌어 프로퍼티의 값이 바뀌는 것을 막기 위하여 setter에서 복사본을 만들어 할당한다. NSCopying 프로토콜을 구현한 객체에서만 가능하다.
- nonatomic : 엑세서들을 non-atomic으로 지정한다. 멀티 프로세서 환경에서는 지정해야 하며, mutually exclusive lock으로 접근자 메서드를 보호하지 말라고 지시하는 것이다.   
