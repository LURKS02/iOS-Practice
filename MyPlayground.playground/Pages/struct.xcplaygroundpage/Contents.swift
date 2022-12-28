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
