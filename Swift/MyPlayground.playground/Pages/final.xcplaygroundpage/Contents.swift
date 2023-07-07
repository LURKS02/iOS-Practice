//final class Friend {
class Friend {
    var name: String
    init(name: String) {
        self.name = name
        print("부모 클래스")
    }
}

class bestFriend: Friend {
    override init(name: String) {
        super.init(name: "sub" + name)
        print("자식 클래스")
    }
}

let myFriend = Friend(name: "KIM")
print("myFriend : \(myFriend.name)")
let mySub = bestFriend(name: "LEE")
print("mySub : \(mySub.name)")
