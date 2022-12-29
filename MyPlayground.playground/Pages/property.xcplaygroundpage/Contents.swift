var myAge = 0 {
    willSet {
        print("값이 설정될 예정이다. my Age : \(myAge)")
    }
    didSet {
        print("값이 설정되었다. my Age : \(myAge)")
    }
}

print("myAge : \(myAge)")
myAge = 20
