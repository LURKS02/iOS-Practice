var numSet = Set<Int>()

numSet.insert(1)
numSet.insert(2)
numSet.insert(3)
numSet.insert(3)
//중복 값 불가능

print(numSet.count)

if numSet.contains(1){
    print("contains 1")
}

if let indexToRemove = numSet.firstIndex(of: 3) {
    numSet.remove(at: indexToRemove)
}

if !numSet.contains(3){
    print("not contains 3")
}
