func makeArr<Item>(repeating item: Item, num: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<num {
        result.append(item)
    }
    return result
}
var ret = makeArr(repeating: 1, num: 3)
print(ret)

func call<Item>(name: Item, num: Int) -> Void {
    for _ in 0..<num {
        print(name)
    }
}
call(name: "KIA", num: 2)
call(name: 5, num: 5)
