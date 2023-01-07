struct Twitch {
    var name : String
    var count : Int
}

var CHOI = Twitch(name: "CHOI", count: 5)
var MIN = CHOI
print("MIN.name = \(MIN.name)")
MIN.name = "MIN"

//값 복사
print("CHOI.name = \(CHOI.name)")
print("MIN.name = \(MIN.name)")

struct Player {
    var name: String
    
    func nameChange() {
        name = "KIM"
    }
}  //오류 : self is immutable

struct Player {
    var name: String
    
    mutating func nameChange() {
        name = "KIM"
    }
}

var player1 = Player(name: "LEE")
player1.nameChange()
print(player1.name)
