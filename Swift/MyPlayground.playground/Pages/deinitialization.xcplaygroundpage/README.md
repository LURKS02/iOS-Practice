# 소멸자(Deinitialization)

- 소멸자 : 클래스 인스턴스의 메모리 할당이 해제되기 직전에 호출된다.

소멸자가 호출될 때 까지는 인스턴스가 할당 해제되지 않기 때문에 소멸자는 인스턴스의 모든 프로퍼티에 접근 및 수정이 가능하다.

```swift
class Bank {
  static var coins = 10_000
  static func distribute(coin num: Int) -> Int {
    let vend = min(num, coins)
    coins -= vend
    return vend
  }
  static func receive(coin: Int) {
    coins += coin
  }
}

class Player {
  var purse: Int
  init(coin: Int){
    purse = Bank.distribute(coin: coin)
  }
  func win(coin: Int){
    purse += Bank.distribute(coin: coin)
  }
  deinit {
    Bank.receive(coin: purse)
  }
}

var playerOne: Player? = Player(coin: 100)
print("\(playerOne!.purse) \(Bank.coins)")
playerOne!.win(coin: 2_000)
print("\(playerOne!.purse) \(Bank.coins)")
playerOne = nil
print("\(Bank.coins)")
```
매모리 할당이 해제될 때 소멸자가 실행된다.
