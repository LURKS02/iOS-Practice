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

let James = Person(name: "James", grade: 80)
James.printPerson()
```
