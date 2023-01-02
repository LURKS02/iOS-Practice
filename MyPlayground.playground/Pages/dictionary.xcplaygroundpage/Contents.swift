var dic: [Int : String] = [1: "IOS", 2: "Android", 3: "Windows"]

print(dic[1])
print(dic[1]!)

var dic2 = [1: ["A","a"], 2: ["B","b"]]
print(dic2[2]![0])

var dic3 : Dictionary = [1: "A", 2: "B", 3: "C"]
dic3.updateValue("D", forKey: 3)
print(dic3)
dic3.removeValue(forKey: 3)
print(dic3)

var dic4 : Dictionary<Int, String> = [1: "A", 2: "B"]
for (key, value) in dic4 {
    print("\(key) \(value)")
}
for key in dic4.keys {
    print(key)
}
for value in dic4.values {
    print(value)
}
