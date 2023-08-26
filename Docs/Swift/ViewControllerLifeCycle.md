어플리케이션은 View Controller로 구성되어 이있는데, 이러한 View Controller는 각각 생명주기를 가지고 있다.

이는 View Controller가 화면에 보여졌다가 사라지는 주기를 말한다.

![R1280x0-2](https://github.com/LURKS02/iOS-Practice/assets/63408930/d840053d-01d8-4464-83fd-b0e10acaac04)

<br>

### loadView()

화면에 띄워줄 view를 만드는 메소드로, view를 만들고 메모리에 올린다.

이 메소드는 직접 호출할 수 없으며 (self.loadView()), 뷰의 추가 초기화는 보통 viewDidLoad() 메소드에서 수행된다.

### viewDidLoad()

뷰의 컨트롤러가 메모리에 로드되고 난 후 시스템에 의해 자동으로 호출된다.

리소스를 초기화하거나 초기 화면을 구성할 수 있다.

이 메소드는 View Controller 생에 **단 한번** 호출된다.

### viewWillAppear()

뷰 컨트롤러의 화면이 올라오고 난 후, 뷰가 화면에 나타나기 직전에 호출된다.

다른 뷰로 이동했다가 다시 돌아올 경우에도 재호출되며, 화면이 나타날 때마다 수행해야 하는 작업을 정의할 수 있다.

### viewDidAppear()

view가 데이터와 함께 완전히 화면에 나타난 후 호출되는 메소드

### viewWillDisappear()

뷰 컨트롤러의 화면이 전환되기 전 또는 뷰 컨트롤러가 사라지기 직전에 호출되는 메소드

### viewDidDisappear()

뷰 컨트롤러가 화면에서 사라지고 나서 호출되는 메소드

<br>

### View 이동에 따른 View Controller 생명주기 메소드의 실행

첫 번째 뷰 → 두 번째 뷰 → 첫 번째 뷰로 다시 돌아올 때

[첫 번째 뷰] viewDidLoad

[첫 번째 뷰] viewWillAppear

[첫 번째 뷰] viewDidAppear

---

[첫 번째 뷰] viewWillDisappear

[두 번째 뷰] viewDidLoad

[두 번째 뷰] viewWillAppear

[첫 번째 뷰] viewDidDisappear

[두 번째 뷰] viewDidAppear

---

[두 번째 뷰] viewWillDisappear

[첫 번째 뷰] viewWillAppear

[두 번째 뷰] viewDidDisappear

[첫 번째 뷰] viewDidAppear

Navigation Controller의 경우 **Stack**과 유사하게 동작하기 때문에 pop을 하면 스택에서 빠져나간 뷰 컨트롤러는 메모리에서 삭제되고, 기존의 뷰 컨트롤러는 메모리에서 유지 상태로 남아있는다.
