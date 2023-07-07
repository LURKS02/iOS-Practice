enum StudentDetail {
  case grade(name: String)
  case age(name: String)

  func get() -> String {
    switch self {
      case .grade(let name):
      return name
      case .age(let name):
      return name
    }
  }
}

let myGrade = StudentDetail.grade(name: "A")
print(myGrade)                        //grade(name: "A")
print("myGrade : \(myGrade.get())")

enum School {
    case elementary
    case middle
    case high
}

let yourSchool = School.elementary
print("yourSchool : \(yourSchool)")
print(yourSchool)


enum Grade : Int {
    case first = 1
    case second = 2
}

let yourGrade = Grade.second
print("yourGrade : \(yourGrade.rawValue)")

enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    
    func get() -> String {
        switch self {
        case.elementary(let name):
            return name
        case.middle(let name):
            return name
        }
    }
}
let yourMiddleSchoolName = SchoolDetail.middle(name: "learning")
print("yourMiddleSchoolName : \(yourMiddleSchoolName.get())")
print(yourMiddleSchoolName)
