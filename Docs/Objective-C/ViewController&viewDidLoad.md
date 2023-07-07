# ViewController 초기화 메서드와 ViewDidLoad

예를 들어 NSDateFormatter를 설정해야 한다고 가정하자.<br>

<br>
이를 ViewController 초기화 메서드에서 설정하는 코드는 다음과 같다.<br>

```objective-c
@interface ListTableViewController()

@property (strong, nonatomic) NSDateFormatter* formatter;

@end


@implementation ListTableViewController

- (instancetype)init {
	self = [super init];
	if (self) {
		_formatter = [[NSDateFormatter alloc] init];
		_formatter.dateStyle = NSDateFormatterMediumStyle;
		_formatter.timeStyle = NSDateFormatterNoStyle;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}
@end
```


<br>
똑같은 작업을 ViewDidLoad 메서드에서 설정하는 코드는 다음과 같다. <br>

```objective-c
@interface ListTableViewController()

@property (strong, nonatomic) NSDateFormatter* formatter;

@end



@implementation ListTableViewController
- (void)viewDidLoad {
	[super viewDidLoad];

	self.formatter = [[NSDateFormatter alloc] init];
	self.formatter.dateStyle = NSDateFormatterMediumStyle;
	self.formatter.timeStyle = NSDateFormatterNoStyle;
}
@end
```

이때 ViewController 초기화 메서드에서 구현할지, viewDidLoad 메서드에서 구현할지 NSDateFormatter를 설정하는 시점의 차이가 존재한다.<br>
그렇다면 어떤 시점에서 설정이 이루어지는 것이 적절할 것인가?<br>

<br>

사용자가 어플리케이션을 시작하면 AppDelegate의 application:didFinishLaunchingWithOptions: 메서드가 호출되며, 어플리케이션의 초기 설정이 수행된다.<br>
이때 첫 번째 ViewController가 생성되며 init 메서드가 호출된다.<br>
ViewController 초기화 메서드는 ViewController의 인스턴스가 생성될 때, 즉 인스턴스가 메모리에 처음 생성될 때 한 번 호출된다.<br>
이때 ViewController가 생성된 후 첫 번쨰 화면을 로드하기 위하여 viewDidLoad 메서드가 호출되며, UI컴포넌트의 초기 설정이 일반적으로 수행된다.<br>
iOS는 메모리 관리를 위해 ViewController의 스택 구조를 사용하며, 사용자가 어플리케이션 내에서 화면을 이동할 때마다 ViewController가 쌓이게 된다.<br>
즉 ViewController는 메모리에 로드된 상태이므로 viewDidLoad 또한 뷰가 메모리에 로드된 직후 한 번만 호출된다. (ViewController가 메모리에서 해제되지 않는 한)
이 둘의 호출 방식은 비슷해보이지만, 어떤 시점에서 설정되어야 하는지에 따라 두 메서드 중 설정을 배치할 수 있다.<br>

<br>

만일 ViewController의 초기화 메서드에서 View에 관련된 설정을 하는 경우, 이 시점에서는 아직 View가 메모리에 로드되지 않았을 수 있기 때문에 예상치 못한 오류가 발생할 수 있다.<br>
따라서 View와 관련된 설정은 ViewDidLoad 메서드에서 수행하는 것이 안전하다.
