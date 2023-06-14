# Weak Reference

다른 인스턴스를 참조하지만 해당 인스턴스의 수명을 연장시키지 않는다.<br>
순환 참조(circular reference) 및 순환 종속성(circular dependency)을 피하고 메모리 누수를 방지할 수 있다.<br>
보통 클래스와 인스턴스에 대하여 가능하며, 참조하는 인스턴스가 언제든지 메모리에서 해제될 수 있으므로 옵셔널로 선언된다.<br>
```swift
class MyClass {
	weak var delegate: MyDelegate?
}
```

<br>

### Delegate 패턴과 Weak Reference

두 객체가 서로를 강하게 참조할 경우 순환 참조가 발생하고, 두 객체 모두 메모리에서 해제되지 않는 문제가 야기될 수 있다.<br>
delegate를 weak reference로 선언하여 delegate가 참조하는 객체가 메모리에서 해제될 때, weak로 선언된 delegate 참조도 함께 nil로 만들 수 있어 순환 참조를 방지하고 메모리 누수를 피할 수 있다.<br>
weak reference는 항상 옵셔널로, 해당 참조는 언제든지 nil이 될 수 있다.<br>
객체의 수명을 연장시키지 않으므로 weak참조만이 특정 객체를 참조하고 있을 경우, 해당 객체는 메모리에서 즉시 해제될 수 있어 객체가 유지되어야 하는 경우에는 문제가 생길 수 있다.<br>

#### 순환 참조 (circular reference)
두 객체가 서로를 강하게 참조(Strong Reference)하는 상황<br>
swift에서 인스턴스의 수명은 ARC(automatic reference counting)에 의하여 관리되며, 한 인스턴스가 다른 인스턴스를 참조할 때마다 참조 카운트가 증가하고, 참조 카운트가 0이 되면 해당 인스턴스는 메모리에서 해제된다.<br>
두 객체가 서로를 강하게 참조하는 경우, 각 객체의 참조 카운트는 절대 0이 될 수 없다.<br>
(객체 A가 객체 B를 참조하는 동시에 객체 B도 A를 참조한다면 서로의 참조 카운트가 적어도 1을 유지하기 때문에, 두 객체는 절대로 메모리에서 해제되지 않는다.)<br>
