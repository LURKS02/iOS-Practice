# Optional과 Unwrapping

## - 옵셔널(Optional)

어떠한 값이 있을수도 없을수도 있다는 것<br>
옵셔널 변수/상수 등은 데이터 타입 뒤에 물음표(?)를 붙여서 표현한다.<br>
옵셔널 변수에 값을 할당하지 않으면 자동으로 nil이 들어간다.

```swift
var myName : String? = "Jake"
//값이 nil일수도 있다는 것
```
옵셔널은 변수 안에 값이 확실히 있다는 것을 보장할 수 없을 때 사용한다.

```swift
var someValue : Int? = 30
var Value = someValue
var nonValue : Int = someValue  //오류
```
이때 Value는 optional 변수가 된다. 
Int와 Int?는 별개의 타입이므로 오류가 발생한다.
<br><br><br>

## - 언래핑(Unwrapping)

옵셔널로 감싸진 옵셔널이 아닌 값을 추출하는 방법<br>
옵셔널의 언래핑 대상은 nil이 될 수 없다.(nil은 값이 아니라 "값이 존재하지 않음"을 나타내는 개념임)<br><br>

> ### 1.강제 추출(Forced Unwrapping)
> > 옵셔널의 실제 값에 상관 없이 강제로 값을 추출하는 것<br>
> > 옵셔널이 nil일 때 강제 추출을 사용하면 에러가 발생
> > ```swift
> > var someValue : Int? = 30
> > var Value : Int = someValue!
> > //오류가 발생하지 않음. Int형 데이터 30만을 얻어옴
> > 
> > var someValue : Int? = nil
> > var nonValue : Int = someValue?
> > //런타임 에러 발생. 값이 존재하지 않는 옵셔널 값에 강제 추출로 접근하였기 때문
> > ```
> >
> ### 2.옵셔널 바인딩(Optional Binding)
> > 값이 있는지 또는 nil인지 먼저 체크하는 방법<br>
> > 옵셔널 표현식의 작성(if let 임시상수 = 옵셔널값 또는 guard let 임시상수 = 옵셔널값)<br>
> > 옵셔널값이 nil이 아니라면 임시상수에 옵셔널 언래핑 값이 저장되고 true를 반환<br>
> > 옵셔널값이 nil이라면 false 반환<br>
> > ```swift
> > var myName: String? = nil
> > if let name = myName {
> >   //옵셔널값 myName이 nil이 아닐 때
> >   print("value")
> > } else {
> >   //옵셔널값 myName이 nil일 때
> >   print("nil")
> > }
> > ```
> > 옵셔널 값이 있으면 if구문에서 처리하고, nil이면 else구문에서 처리한다.<br>
> > 옵셔널 값의 경우에 대한 피드백을 제공할 때 사용한다.<br>
> > 
> > ```swift
> > guard let name = myName else {
> >   //옵셔널값 myName 이 nil일 때
> >   return
> > }
> > ```
> > 옵셔널 값이 있으면 계속 진행하고, nil이면 return한다.<br>
> > 옵셔널 값이 nil인 경우 무조건 함수를 종료시키고 싶을 때 사용한다.<br>
> > 
> ### 3.옵셔널 체이닝(Optional Chaining)
> > .(dot)을 통해 내부 프로퍼티 또는 메서드에 연속적으로 접근할 때, 중간에 하나라도 nil이 발견된다면 nil을 반환하는 형시<br>
> > 옵셔널 표현식의 멤버에 접근할 때, 표현식이 nil일 수 있기 때문에 ?를 붙여준다.<br>
> > 표현식이 nil이면 전체 값도 nil이고, 표현식이 nil이 아니라면 언래핑 값으로 연쇄 접근한다.<br>
> > 옵셔널 표현식의 결과값은 항상 옵셔널이다.<br>
> > 옵셔널 체이닝의 결과 타입은 마지막 표현식의 옵셔널이다.<br>
> >
> > ```swift
> > class Person {
> >   var residence: Residence?
> > }
> > class Residence {
> >   var numberOfRooms = 1
> > }
> > 
> > let zedd = Person()
> > if let roomCount = zedd.residence?.numberOfRooms {
> >   print("zedd's residence has \(roomCount) room(s).")
> > } else {
> >   print("Unable to retrieve the number of rooms.")
> > }
> > ```
> > 프로퍼티를 통해 체인처럼 이어져 있으며, nil이 아니라면 다음으로 넘어간다.
> > 
> > ```swift
> > struct Contacts {
> >   var email: String
> >   var address: String
> > }
> > 
> > struct Person {
> >   var name: String
> >   var contacts: Contacts
> > 
> >   init(name: String, email: String, address: String){
> >     self.name = name
> >     contacts = Contacts(email: email, address: address)
> >   }
> > }
> > 
> > var tom: Person? = Person(name: "Tom", email: "tomntoms@naver.com", address: "Seoul")
> > 
> > tom.contacts.email  //에ㄹ
> > tom?.contacts.email
