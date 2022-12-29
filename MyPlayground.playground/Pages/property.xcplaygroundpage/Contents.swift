var myAge = 0 {
    willSet {  //해당 프로퍼티에 값이 설정되기 직전에 실행
        print("값이 설정될 예정이다. my Age : \(myAge)")
    }
    didSet {  //해당 프로퍼티에 값이 설정되고 나서 실행
        print("값이 설정되었다. my Age : \(myAge)")
    }
}

print("myAge : \(myAge)")
myAge = 20

class Person {

  var name: String = "KIM"

  var alias: String {
    get {           //getter : 어떤 저장 프로퍼티의 값을 연산해서 return할 것인지
      return name
    }
    set(name) {     //setter : 파라미터로 받은 값을 어떤 저장 프로퍼티에 어떻게 설정할 것인지
      self.name = name
    }
  }
}
let kim: Person = .init()
kim.alias = "Jake"  //set에 접근
print(kim.alias)    //get에 접근


class Person {
  static let name: String = "KIM"
  static var alias: String {
    return name
  }
}
print(Person.name)
