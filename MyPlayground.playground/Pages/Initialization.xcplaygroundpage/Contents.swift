class Friend {
    var name = "철수"
    init(){
        print("생성자 이름 : \(name)")
    }
    init(_ name: String) {
        self.name = name
        print("생성자 이름 : \(self.name)")
    }
}

var myFriend = Friend()
var mySecondFriend = Friend("영희")

