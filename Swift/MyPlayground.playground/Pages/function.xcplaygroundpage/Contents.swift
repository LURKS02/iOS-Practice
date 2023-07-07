func sum(a: Int, b: Int) -> Int {
    return a + b
}
print(sum(a: 5, b: 3))

func sample(a: String, b: String = "World") {
    print("\(a), \(b)!")
}
sample(a: "Hello")

func printName(name: String) -> String {
    return "My name is \(name)."
}

func printDes(from name1: String, to name2: String) ->String {
    return "From \(name1) to \(name2)"
}

func printnoName(_ name: String) ->String {
    return "My name is \(name)."
}

print(printName(name: "KIM"))
print(printDes(from: "Jake", to: "Marie"))
print(printnoName("KIM"))
