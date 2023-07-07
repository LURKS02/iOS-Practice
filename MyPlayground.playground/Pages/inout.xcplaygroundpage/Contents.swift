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

func swap(_ aVal: inout Int, _ bVal: inout Int) {
    let tempVal = aVal
    aVal = bVal
    bVal = tempVal
}

var firstInt = 100
var secondInt = 200
swap(&firstInt, &secondInt)
print("firstInt : \(firstInt), secondInt : \(secondInt)")
