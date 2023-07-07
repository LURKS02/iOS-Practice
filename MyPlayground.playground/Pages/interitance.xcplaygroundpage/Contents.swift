class Person {
    var age: Int
    var name: String
    
    init(age: Int, name: String) {  //생성자
        self.age = age
        self.name = name
    }
    func printClass() {
        print("부모 클래스")
    }
}

class Student: Person {
    var id: Int
    init(age: Int, name: String, id: Int) {
        self.id = id
        super.init(age: age, name: name)
    }
    override func printClass() {
        super.printClass()
        print("자식 클래스")
    }
}
var person1 = Person(age: 12, name: "Jake")
var person2 = Student(age: 15, name: "Chris", id: 300)
person1.printClass()
person2.printClass()

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
