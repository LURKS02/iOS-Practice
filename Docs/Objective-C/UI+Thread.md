# iOS의 UI 작업과 메인 스레드의 관련성

#### 비동기 작업

다른 작업이 완료되기를 기다리지 않고 독립적으로 실행되는 작업<br>
일반적으로 I/O 작업, 네트워킹 작업 등은 시간이 오래 걸리므로 비동기적으로 처리하고, 어플리케이션이 사용자 입력과 같은 중요한 작업을 계속 처리할 수 있도록 한다.<br>

#### iOS의 UI 업데이트 작업

iOS 및 대부분의 UI 프레임워크는 UI 업데이트를 메인 스레드에서만 처리하도록 설계되어 있다.<br>
UI 업데이트는 복잡하며 많은 자원을 사용하고, 동시성 문제를 일으킬 수 있으므로 메인 스레드에서 처리된다.<br>

#### 네트워킹 작업과 UI 작업이 결합된 경우
네트워킹 작업은 비동기 작업인데, 네트워킹 작업이 완료된 후 UI 업데이트가 이루어져야 하는 경우가 있다.<br>
이럴 때는 해당 업데이트를 메인 스레드로 명시적으로 전환시켜야 한다.<br>

<br>
즉, 네트워킹 작업을 포함하는 함수 자체는 비동기적으로 실행되지만, 네트워킹 작업이 완료되고 결과를 받아서 UI를 업데이트하는 작업은 메인 스레드에서 이루어져야 한다.<br>
따라서 해당 작업은 dispatch_async(dispatch_get_main_queue(), ^{})를 통하여 메인 스레드에서 실행되도록 한다.<br>

