# NSOperation

Objective-C 기반의 고수준 API
내부적으로 C로 구현된 GCD를 고수준 언어로 Wrapping한 것<br>
GCD보다 다소 무겁고 약간의 오버헤드가 발생한다.<br>
작업 취소, KVO, 작업 재사용 등 GCD에서 제공하지 않는 기능들을 사용할 수 있다.<br>
이를 이용하여 각 작업들간에 의존성을 설정하고, 우선순위 큐와 QOS를 통해 작업을 수행할 수 있으며 나중에 다른 곳에서 참조할 수 있도록 결과를 보관하는 것이 가능하다.<br>

<br>

### NSOperation

하나의 작업 단위를 나타내며, 모델링 상태, 우선순위, 의존성, 관리를 지원하는 Thread safe한 추상 클래스<br>
Operation을 Concurrent Queue인 NSOperationQueue에 추가하여 실행한다.<br>

<br>

### NSOperationQueue
작업의 동시 실행을 조절하며, 우선순위 큐(FIFO + 높은 우선 순위의 작업이 들어올 경우 더 낮은 우선 순위 작업들을 건너뛰고 실행)로 동작한다.<br>
maxConcurrentOperationCount 프로퍼티를 통해 주어진 특정 시간동안 동시에 실행 가능한 작업의 숫자를 제한할 수 있다.<br>

<br>

### State
NSOperation은 명시적인 state 프로퍼티가 존재하는 대신 암묵적으로 해당 키패스에 KVO 통지를 하게 된다.<br>
(Ex. 작업이 실행될 준비가 되었다면 ready 키패스에 KVO 통지를 하여 대응하는 프로퍼티가 true를 반환하게 한다.)<br>

- ready : 해당 값이 true를 반환한다면 작업이 실행될 준비가 되었음을 의미하며,  false라면 작업의 초기화가 끝나지 않았다는 것을 의미한다.<br>
- executing : 해당 값이 true를 반환한다면 작업이 현재 진행중임을 의미하며, false라면 그 외의 상황임을 의미한다.<br>
- Finished : 해당 값이 true를 반환한다면 작업이 성공적으로 종료되었거나 취소되었음을 의미하며, NSOperationQueue는 이 값이 true로 바뀌지 않는 한 큐에서 Dequeue하지 않으므로 데드락을 야기할 수 있다.<br> 

<br>

### Cancellation
필요없는 작업이 실행되는 것을 방지하거나, 의존성 있는 작업이 실패하였거나, 유저에 의한 명시적 취소가 발생할 때 취소 작업이 실행될 수 있다.<br>
작업이 취소되면 NSOperation은 KVO를 통해 cancelled 키패스에 통지를 보내며, 내부의 사용되던 자원들을 정리하고 가능한 빨리 적절한 최종 상태로 변경하게 된다.<br>
이때 cancelled와 finished 프로퍼티의 값이 true로 바뀌며, executing 프로퍼티의 값은 false로 변경된다.<br>

<br>

### Priority
모든 작업들에는 중요성이 존재하며, queuePriority 프로퍼티의 값을 설정하여 NSOperationQueue가 우선순위를 상승 또는 하강시키게 된다.<br>

<br>

### Asynchronous Operations
NSOperation이 동기 또는 비동기로 실행되는 것을 결정하는 방법이다.<br>

<br>

### Dependencies
```objective-c
NSOperation *networkingOperation
NSOperation *resizingOperation
[resizingOperation addDependency: networkingOperation];

NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
[operationQueue addOperation: networkingOperation];
[operationQueue addOperation: resizingOperation];
```

```swift
let networkingOperation: NSOperation
let resizingOperation: NSOperation
resizingOperation.addDependency(networkingOperation)

let operationQueue = NSOperationQueue.mainQueue()
operationQueue.addOperations([networkingOperation, resizingOperation], waitUntilFinished: false)
``` 

의존성을 가지고 있는 작업들의 finished값이 true가 될때까지 해당 작업이 실행되지 않게 하는 것<br>
의존성 사이클이 생길 경우 데드락이 발생할 수 있다.<br>

<br>

### Completion Block
```objective-c
NSOperation *operation;
operation.completionBlock = ^{
	// code here
};

[[NSOperationQueue mainQueue] addOperation: operation];
```

```swift
let operation = NSOperation()
operation.completionBlock = {
	// code here
}

NSOperationQueue.mainQueue().addOperation(operation)
```

NSOperation이 종료될 때, Completion Block이 호출된다.<br>
모델 또는 뷰 컨트롤러에서 작업이 수행될 때 부가적인 작업을 수행할 수 있는 방법을 제공한다.<br>

