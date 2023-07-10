# Serial & Concurrent

### Serial
Queue에 들어온 작업들을 순차적으로 실행시키는 것<br>
Serial Queue는 한 번에 하나의 Task만 실행시킬 수 있으며, 작업을 동기화할 때 주로 사용한다.<br>
Ex) SerialQueue, main Queue 등<br>

<br>

### Concurrent
Queue에 들어온 작업들을 동시다발적으로 실행시키는 것<br>
한 번에 여러 개의 Task를 실행시킬 수 있다.<br>
```swift
let concurrentQueue = DispatchQueue.init(label: “MyQueue”, attributes: .concurrent)
concurrentQueue.sync { //	 작업1 }
concurrentQueue.async { // 작업2 }
concurrentQueue.sync { // 작업3 }
```

