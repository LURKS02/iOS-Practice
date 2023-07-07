var someVariable : Int?

if someVariable == nil {
    someVariable = 1
}

if let otherVariable = someVariable {
    print("값이 있다. otherVariable : \(otherVariable)")
} else {
    print("값이 없다.")
}

someVariable = nil
let myValue = someVariable ?? 10
print("myValue : \(myValue)")

var emptyValue : Int?

myFunction(parameter: myValue)
myFunction(parameter: emptyValue)

func myFunction(parameter: Int?) {
    print("myFunction called")
    
    guard let unWrappedParam = parameter else {return}
    print("unWrappedParam : \(unWrappedParam)")
}
