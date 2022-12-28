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
> > 값이 있는지 또는 nil인지 먼저 체크하는 방법
> > 옵셔널 표현식의 작성(if let 임시상수 = 옵셔널값 또는 guard let 임시상수 = 옵셔널값)
> > 옵셔널값이 nil이 아니라면 임시상수에 옵셔널 언래핑 값이 저장되고 true를 반환
> > 옵셔널값이 nil이라면 false 반환
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
> > 옵셔널 값이 있으면 if구문에서 처리하고, nil이면 else구문에서 처리한다.
> > 옵셔널 값의 경우에 대한 피드백을 제공할 때 사용한다.
> > 
> > ```swift
> > guard let name = myName else {
> >   //옵셔널값 myName 이 nil일 때
> >   return
> > }
> > ```
> > 옵셔널 값이 있으면 계속 진행하고, nil이면 return한다.
> > 옵셔널 값이 nil인 경우 무조건 함수를 종료시키고 싶을 때 사용한다.
> > 
> 

옵셔널 변수 뒤에 느낌표(!)를 붙여주면 강제로 값을 추출하여 반환한다.
강제 추출시 옵셔널에 값이 없다면 런타임 오류가 발생한다.
```swift
if convertedNum != nil {
  print("convertedNum has an integer value of \(convertedNum!)")
```

-
