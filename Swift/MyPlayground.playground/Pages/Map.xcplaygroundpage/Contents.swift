import Foundation

let item = ["가방", "책", "블로그", "지갑"]
func addName(name: String) -> String {
    return "소중한 " + name
}
let valueItem = item.map(addName)
print(valueItem)
