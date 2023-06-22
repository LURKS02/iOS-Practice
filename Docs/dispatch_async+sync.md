# dispatch_async / sync

### dispatch_async
작업을 큐에 추가하고, 그 작업이 언제 실행될지는 신경쓰지 않는다.<br>
<비동기>방식으로, dispatch_async를 호출하는 즉시 함수는 반환되고, 이후에 대기중인 작업이 실행된다.<br>

### dispatch_sync
작업을 큐에 추가하고, 그 작업이 완료될 때까지 기다린다.<br>
<동기>방식으로, dispatch_sync가 호출하는 작업이 완료될 때까지 현재 스레드는 블록된다.<br>

<br>

UI 업데이트와 같은 작업을 메인 스레드에서 처리할 때, UI 업데이트가 블록되어서는 안되기 때문에 dispatch_async를 주로 사용한다.<br>
메인 스레드에서 dispatch_sync를 사용하면 UI 업데이트 작업이 완료될 때까지 애플리케이션의 다른 부분이 모두 멈추게 된다.<br>
