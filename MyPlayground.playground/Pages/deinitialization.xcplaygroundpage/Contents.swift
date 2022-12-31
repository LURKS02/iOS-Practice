class Friend {
    var name = "철수"
    init() {
        print("생성자 이름 : \(self.name)")
    }
    
    init(_ name: String){
        self.name = name
        print("생성자 이름 : \(self.name)")
    }
    
    deinit {
        print("소멸자 이름 : \(self.name)")
    }
    
    var calledTimes = 0
    let MAX_TIMES = 5
    static var instancesOfSelf = [Friend]()
    class func destroySelf(object: Friend) {
        instancesOfSelf = instancesOfSelf.filter {
            $0 !== object
        }
    }
    func call() {
        calledTimes += 1
        print("called \(calledTimes)")
        if calledTimes > MAX_TIMES {
            Friend.destroySelf(object: self)
        }
    }
}

var myFriend = Friend()
var mySecondFriend = Friend("영희")
weak var selfDestructingObject = Friend("수진")

