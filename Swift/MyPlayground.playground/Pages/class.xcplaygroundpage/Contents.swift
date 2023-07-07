class Youtube {
    var name : String
    var count : Int
    
    // init으로 매개변수를 가진 생성자 메소드를 만들면 매개변수를 넣어 객체 생성이 가능
    init(name: String, count: Int) {
        self.name = name
        self.count = count
    }
}

var KIM = Youtube(name: "KIM", count: 10)
var me = KIM
print("me.name = \(me.name)")
me.name = "LEE"

//참조로 인해 값이 변경됨
print("KIM.name = \(KIM.name)")
print("me.name = \(me.name)")
