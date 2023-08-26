#  then

then을 이용하여 코드를 간략하게 단축할 수 있다.

```jsx
let label = UILabel().then {
	$0.text = "text"
	$0.textAlignment = .center
}
```

<br>

### then의 구현 (틀린 예시)

```jsx
extension UIView {
	func then(_ block: ((Self) -> Void)) -> Self {
		block(Self)
		return Self
	}
}
```

UIView의 extension으로 정의하였지만, 이 경우 제대로 동작하지 않는다.

<br>

### then의 구현 (올바른 예시)

```jsx
public protocol Then {}
public extension Then {
    func then(_ block: ((Self) -> Void)) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Then {}
```

반면 다음과 같이 정의할 경우 정상적으로 동작한다.

<br>

### Covariant 'Self' type cannot be referenced from a stored property initializer

- 첫 번째 구현

첫 번째 구현에서, then 메서드가 UIView 타입에 직접 추가되며 이 코드 내부의 Self는 UIView 또는 서브클래스 중 하나를 나타낸다.

이때 컴파일러는 then 메서드가 호출되는 시점에 Self의 정확한 타입을 알 수 없으며, 따라서 컴파일러는 then 메서드 내부에서 Self가 UILabel인지, UIButton인지, 다른 서브클래스인지 구분할 수 없다.

클래스에서의 Self는 현재 클래스 또는 서브 클래스를 참조한다. 따라서 UIView의 확장에서의 Self는 컴파일 타임에 다양한 가능성을 가지므로, 컴파일러는 Self가 정확히 어떤 타입을 나타내는지 알 수 없다.

즉, 클래스의 계층 구조 때문에 슈퍼 클래스의 확장에서는 어떤 서브 클래스에서 해당 확장이 사용될지 예측하기 어렵다.

- 두 번째 구현

프로토콜 확장에서, Self는 Then 프로토콜을 구현하는 타입을 나타내며, NSObject 및 그 서브클래스 모두 Then 프로토콜을 준수한다면, then 메서드 호출 시 Self는 호출하는 객체의 구체적인 타입을 나타내게 된다.

따라서 컴파일러는 Self의 정확한 타입을 UILabel, UIButton 등으로 알 수 있다.

여기서 Self는 프로토콜을 준수하는 객체의 타입에 바인딩되므로, 해당 프로토콜을 준수하는 구체적인 타입을 준수하게 된다.
