# Type Casting


```swift
let myValue = record.object(forkey: "comment") as! String
```
메서드나 함수가 반환하는 값이 불확실할 경우, as 키워드를 통해 의도한 값의 타입을 컴파일러에게 알려줄 수 있다.<br>

<br>

### Upcasting
#### as
```swift
let myButton: UIButton = UIButton()
let myButton = myButton as UIControl
// UIControl은 UIButton 상위 클래스이므로 안전하게 캐스팅이 가능하다.
```
특정 자식 인스턴스를 상위 부모 클래스로 캐스팅하는 것<br>
as 키워드를 사용하며, 하위 클래스는 상위 클래스의 부분집합이므로 업캐스팅은 언제나 성공한다.<br>
따라서 보장된 변환(guaranteed conversion)으로 불린다.<br>

<br>

### Downcasting
어떤 클래스로부터 해당 클래스의 하위 클래스로 변환하는 것<br>
해당 클래스의 하위 클래스는 여러 개일 수 있으므로, 실패할 수 있다.<br>
컴파일러가 발견하지 못한 에러가 런타임에서 발생할 수 있으며, 강제 변환(forced conversion)이라고 불린다.<br>
#### as!
캐스팅 성공 확신이 있을 경우 사용한다.<br>
반환 실패시 런타임 에러가 발생하므로 주의가 필요하다.<br>
#### as?
안전성에 대비하여 as?를 이용한 옵셔널 바인딩을 사용한다.<br>
다운캐스팅이 성공적으로 수행된다면 지정한 타입의 옵셔널 값이 반환되며, 오류가 발생한다면 옵셔널 값은 nil이 된다.<br>

<br>

### is
```swift
if myObject is MyClass {
	// ...
}
```
is 키워드를 통하여 타입 검사가 가능하다.<br>
지정된 객체가 검사하는 클래스의 인스턴스인지 검사한다.<br>
