func say(_ name: String) {
    print("name: \(name)")
}

say("KIM")

func say2(_ name: inout String) {
    name = "add " + name
    print("name : \(name)")
}
var name = "KIM"

say2(&name)
