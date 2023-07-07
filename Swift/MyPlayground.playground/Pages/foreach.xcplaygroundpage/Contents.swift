import UIKit

var myArray : [Int] =
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for item in myArray {
    print("item : \(item)")
}

for item in myArray where item > 5 {
    print("5보다 큰수 : \(item)")
}

for item in myArray where item % 2 == 0 {
    print("짝수 : \(item)")
}

for i in 0...5 {
    print("i = \(i)")
}

for i in 0..<5 {
    print("i = \(i)")
}

var randomInts: [Int] = []
for _ in 0..<25 {
    let randomNumber = Int.random(in: 0...100)
    randomInts.append(randomNumber)
}
print("randomInts : \(randomInts)")
