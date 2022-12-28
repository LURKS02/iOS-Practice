# Struct

- Struct(구조체)

객체를 정의하기 위한 도구<br>
값 타입(Value)으로, 데이터를 복사해 그 값을 전달한다.<br>

- Struct 구문 예시
```swift
struct Person {
  var name: String
  var grade: Int
}

var James = Person(name: "James", grade: 80)
var Nick: Person = James
Nick.name = "Nick"

print(James.name)
print(Nick.name)
```
struct는 값에 의한 전달 방식으로 값 타입(Value type)이라고 한다.<br>
구조체 인스턴스를 변수에 대입하면 복사된 새로운 값이 대입된다.<br>
따라서 인스턴스를 할당한 후에 기존의 인스턴스 또는 할당된 쪽의 인스턴스에 변경이 발생하더라도 서로에게 전혀 영향이 미치치 않는다.

