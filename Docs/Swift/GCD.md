# GCD (Grand Central Dispatch)

멀티코어 시스템에서 동시성 실행을 제공하는 프로그래밍 언어 요소, 런타임 라이브러리 등<br>
이러한 GCD 개념을 이용하여 동시성 프로그래밍을 지원하는 스위프트 API를 Dispatch Queue라고 한다.<br>

### Dispatch Queue
```swift
DispatchQueue.{큐종류}({qos 옵션}).{sync/async} {
}
```
작업을 정의하여 Dispatch Queue에 넣어주면, 운영체제가 Dispatch Queue의 작업들을 적절한 스레드에 할당하게 된다.<br>
큐의 종류, qos 우선순위, sync/async를 설정하여 지정한 작업을 DispatchQueue를 통해 현재 또는 다른 스레드에서 실행할 수 있도록 한다.<br>

#### Serial
큐에 등록된 작업을 한 번에 하나씩 처리하는 것<br>
먼저 들어온 작업이 완료되어야 큐에 있는 다른 작업을 시작하게 된다.<br>

#### Concurrent
DispatchQueue에서 꺼내온 현재 작업이 끝나지 않아도 다음 작업을 다른 스레드에 할당해서 동시에 여러 작업이 실행되도록 한다.<br>

<br>

### Dispatch Queue의 종류
#### Main Queue
메인 스레드에서 작업을 보관하고 수행하는 큐<br>
메인 스레드에서 동작하므로 단 하나만 존재하며, Serial 특성을 가진다.<br>
UI업데이트와 관련된 모든 작업은 Main Queue에 할당된다.<br>

#### Global Queue
메인 스레드가 아닌 다른 스레드에서 작업을 처리하며, concurrent 특성을 가지므로 여러 스레드로 작업이 분산되어 동시에 처리된다.<br>

#### Custom Queue
사용자가 어떤 특성의 큐로 Dispatch Queue를 생성할지 결정할 수 있도록 해준다.<br>
기본값은 Serial이지만, 생성시 attributes 인자를 통해 concurrent로 변경이 가능하다.<br>

<br>

### QOS (Quality of Service)
concurrent하게 작업이 분산되어 실행될 때, 작업의 중요도를 설정하여 실행의 우선순위를 부여할 수 있다.<br>
우선순위가 높은 큐는 더 많은 스레드에 작업을 분산시킬 수 있으며, 우선순위가 낮은 큐는 상대적으로 적은 스레드에 작업을 분산시킨다.<br>
#### 1. userInteractive
사용자와 직접 상호작용을 하는 작업을 의미하므로, 사용자의 요청에 곧바로 응답이 있어야하는 애니메이션 처리, 이벤트 처리, UI 업데이트 등의 작업을 말하며, 가장 높은 우선순위를 가진다.<br>
#### 2. userInitiated
사용자가 요청시 그 결과를 바로 받아야하거나, 사용자가 어플리케이션을 사용하는 것을 순간적으로 막기 위한 경우에 해당한다. (Ex. 사용자에게 보여줄 이메일 내용을 로드할 때)<br>
#### 3. default
기본적으로 일반적인 작업  
#### 4. utility
사용자가 어플리케이션을 계속 사용하지 않도록 막지 않는 작업에 사용한다. (Ex. 사용자와 상호작용하지 않으면서 오랜 시간동안 어떤 작업을 진행해야 하는 경우)<br>
#### 5. background
어플리케이션이 백그라운드에서 실행 중일 때 진행하는 작업에 사용하며, 가장 낮은 우선순위를 가진다.<br>

<br>

### Queue와 sync / async
#### Serial + Async
```swift
let dispatchQueue = DispatchQueue(label: “Custom”)
dispatchQueue.async {
}
```
모든 작업들이 작업 결과와 상관 없이 큐에 등록되며, 작업은 큐에서 하나씩 꺼내서 메인 스레드에서 처리하게 된다.<br>
이때 작업들의 등록 순서와 출력 순서가 일치한다.<br>
#### Concurrent + Sync
```swift
DispatchQueue.global().sync {
}
```
큐에 등록되는 작업들이 여러 스레드에 분산되어 처리된다.<br>
작업을 sync로 등록하므로 작업의 등록 순서와 출력 순서가 항상 일치하게 된다.<br>
#### Concurrent + Async
```swift
DispatchQueue.global().async {
}
```
작업을 완료 여부와 상관없이 계속 등록하고, 등록된 작업들이 스레드에 분산되어서 동시에 실행되므로 등록 순서와 출력 순서가 항상 일치하지는 않는다.<br>

<br>

### DeadLock의 발생 가능성
#### 1. Main Thread에서 main.sync 작업을 진행하는 경우
```swift
DispatchQueue.main.sync
```
Main Dispatch Queue에서 sync 작업을 호출하면 메인 스레드는 진행을 멈추고 등록한 작업이 끝날 때까지 기다리게 된다.<br>
동시에 큐에 등록된 sync 작업은 메인 스레드로 할당된다.<br>
하지만 메인 스레드는 아무것도 할 수 없는 상태이므로 작업을 수행할 수 없고, 작업은 시작되지 못하고 데드락 상태에 빠지게 된다.<br>

  
#### 2. 동일한 큐에서 sync 호출
```swift
DispatchQueue.global().async {
	DispatchQueue.global().sync {
	}
}
```
동일한 큐에서 작업을 등록하고 해당 작업을 동일한 큐에 sync로 등록하게 되면, 동일한 스레드에 다시 한 번 작업을 할당하게 될 수 있다.<br>
즉, sync로 등록된 작업이 종료될 때까지 기다리는 async 스레드에 해당 sync 작업이 등록된다면 데드락 상태가 발생한다.<br>
