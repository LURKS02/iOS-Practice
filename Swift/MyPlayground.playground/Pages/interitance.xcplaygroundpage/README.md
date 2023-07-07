# Inheritance(상속)

### - 상속(inheritance)

한 클래스가 가지고 있는 프로퍼티와 메소드를 다른 클래스에게 그대로 승계해주는 것<br>
> 승계해주는 클래스 : 부모/슈퍼/상위 클래스<br>
> 승계 받는 클래스 : 자식/서브/하위 클래스<br>
```swift
class SubClass: SuperClass {
}
```
<br>

### - 오버라이딩(재정의, Overriding)

프로퍼티의 접근자, 설정자, 감시자의 재정의<br>
프로퍼티의 오버라이딩은 상위 클래스의 기능을 하위 클래스가 확장 및 변경하는 형태로 진행된다.<br>
저장 프로퍼티르 오버라이딩하면 연산 프로퍼티가 된다.
```swift
class Grade {
    var type = "A"
}

class Change: Grade {
    override var type: String {
        get {
            return "B"
        }
        set {
            super.type = newValue
        }
    }
}

let grade1 = Grade()
let grade2 = Change()
print(grade1.type)
print((grade2 as Grade).type)
print(grade2.type)
```
오버라이딩 대상이 되는 메소드의 매개변수 개수, 타입, 반환 타입은 변경할 수 없다.<br>
메소드 오버라이딩을 통해 변경할 수 있는 것은 내부 구문 뿐이다.

