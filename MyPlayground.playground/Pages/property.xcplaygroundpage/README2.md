## - 프로퍼티 감시자(Property Observer)
프로퍼티 값의 변화를 관찰하는 것으로, 속성 값이 설정되면 호출된다.<br>
+ willSet : 값이 저장되기 직전에 호출된다.
+ didSet : 새 값이 저장된 직후에 호출된다.
```swift
var myAge = 0 {
    willSet {  //해당 프로퍼티에 값이 설정되기 직전에 실행
        print("값이 설정될 예정이다. my Age : \(myAge)")
    }
    didSet {  //해당 프로퍼티에 값이 설정되고 나서 실행
        print("값이 설정되었다. my Age : \(myAge)")
    }
}
```
newValue를 통해 파라미터에 접근할 수 있다.
