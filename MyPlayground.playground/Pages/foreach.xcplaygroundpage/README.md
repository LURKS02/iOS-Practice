# Class

- Class(클래스)
객체를 정의하기 위한 도구<br>
참조 타입(reference)으로, 데이터를 메모리에 올리고 메모리의 위치를 전달한다.<br>

- Class 구문 예시
```swift
class Person {
  var name: String
  var grade: Int
  
  init(name: String, grade: Int) {
    self.name = name
    self.grade = grade
  }
  
  func printPerson() {
    print("My name is \(name) and my grade is \(grade)")
  }
}

var James = Person(name: "James", grade: 80)
James.printPerson()
```
class 인스턴스의 값 전달 방식은 메모리 주소 참조에 의한 전달 방식으로 참조 타입(Reference type)이라고 한다.<br>
인스턴스가 저장된 메모리 주소 정보가 전달되므로 원본 값에 접근하게 된다.

- Class의 참조 타입
```swift
var Nick = Person(name: "Nick", grade: 100)
var Smith: Person = Nick
Smith.name = "Smith"

print(Nick.name)
print(Smith.name)
//참조(reference)에 의한 전달이므로 원본 값이 동시에 변경
```
```swift
func gradeUp(_ person: Person) {
  person.grade += 10
}
gradeUp(James)
print(James.grade)
//참조(Reference)에 의한 전달이므로 원본 값이 변경
```
