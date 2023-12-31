# Thread

### Thread

한 프로세스 내에서 동작되는 여러 실행의 흐름<br>
Code, Data, Heap 영역은 공유하지만, Stack 영역은 독립적으로 할당받는다.<br>
Stack은 LIFO로, 스택이 쌓이면 프로세스가 섞여 흐름에 방해를 주기 때문에 별도의 영역을 지닌다.<br>

<br>

### Multi Thread
하나의 프로그램을 여러 개의 쓰레드로 구성하여 각 쓰레드마다 하나의 작업(Task)을 처리하게 하는 것 <br>
쓰레드 간에 Core, Data, Heap 영역을 공유하므로 Context Switching이 빠르게 일어난다.<br>

#### Multi Thread 의 장점

쓰레드는 메모리와 같은 시스템 리소스를 공유하므로 새로운 쓰레드를 만드는 것이 새로운 프로세스를 만드는 것 보다 적은 비용이 든다.<br>
Stack 영역을 제외하고 나머지 영역을 공유하기 때문에 통신 방법이 간단하다.<br>

#### Multi Thread 의 단점
Stack 영역을 제외하고 동일한 메모리 공간을 공유하기 때문에 자원 공유 (동기화) 문제가 생긴다.<br>
독립적인 구조가 아니므로 한 쓰레드에서 문제가 발생하면 전체 쓰레드가 영향을 받는다.<br>
단일 프로세스 시스템의 경우 효과를 기대할 수 없다.<br>
