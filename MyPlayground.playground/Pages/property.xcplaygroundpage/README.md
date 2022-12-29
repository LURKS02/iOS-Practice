# Property(프로퍼티)

## - property : 클래스와 구조체 내에서 정의된 변수나 상수
> ### 1. 저장 프로퍼티(Stored Property)
> 클래스와 구조체 내에서 값을 저장하기 위해 선언되는 상수 및 변수<br>
> ```swift
> struct Person {
>   var name: String  //저장 프로퍼티
>   var age: Int      //저장 프로퍼티
> }
> ```
> 프로퍼티 선언시 초기값이 할당되지 않은 저장 프로퍼티는 반드시 옵셔널 타입이어야 한다.<br>
>
>  ### 2. 연산 프로퍼티(Computed Property)
> 
> 실제 값을 저장했다가 반환하는 방식이 아닌, 다른 프로퍼티의 연산 값을 처리하여 간접적으로 값을 제공한다.<br>
> 저장 공간을 갖지 않으며, 항상 var로 선언된다.<br>
> 클래스, 구조체 및 열거형에서 사용된다.<br>
> ```swift
> class Person {
>   var name: String = "KIM"
>   var alias: String {
>     get {           //getter : 어떤 저장 프로퍼티의 값을 연산해서 return할 것인지
>       return name
>     }
>     set(name) {     //setter : 파라미터로 받은 값을 어떤 저장 프로퍼티에 어떻게 설정할 것인지
>       self.name = name
>     }
>   }
> }
> let kim: Person = .init()
> kim.alias = "Jake"  //set에 접근
> print(kim.alias)    //get에 접근
> ```
> 연산 프로퍼티는 어떠한 값을 저장하는 것이 아니기 때문에, 반드시 선언시 타입 어노테이션을 통하여 자료형을 명시해야 한다.<br>
> 연산 프로퍼티 선언시 타입을 명시했기 때문에 set의 파라미터 타입을 명시해주지 않아도 된다.
> get-only는 가능하지만, set-only는 불가능하다.
> ```swift
> class Person {
>   var name: String = "LEE"
>   var alias: String {
>     get {
>       return name
>     }
>     set {
>       self.name = newValue
>     }
>   }
> }
> ```
> set에서는 파라미터를 생략하고 newValue로 파라미터에 접근할 수 있다.
> 
> ### 3. 타입 프로퍼티(Type Property)
> 
> 타입 자체에 속하는 프로퍼티로, 모든 인스턴스에서 공용으로 접근할 수 있다.
> static을 이용해 선언하여 저장 타입 프로퍼티와 연산 타입 프로퍼티로 사용할 수 있다.
> 저장 타입 프로퍼티의 경우 항상 초기값을 가져야 한다.
> ```swift
> class Person {
>   static let name: String = "KIM"
>   static var alias: String {
>     return name
>   }
> }
> print(Person.name)
> ```
> 타입 프로퍼티는 타입 이름에 .(dot)을 통하여 접근할 수 있다.<br>
> 
