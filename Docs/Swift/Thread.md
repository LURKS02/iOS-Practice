# Thread

### Main Thread (Interface Thread)
iOS에서 Main Thread는 한 개만 존재하며, UI와 관련된 작업은 반드시 Main Thread에서 실행된다.<br>
Main Thread는 Main Queue에서 실행되는데, Main Queue는 Serial Queue로, 한 번에 하나의 Task만 실행하므로 Main Thread에서 시간이 걸리는 작업을 하게 되면 어플리케이션 화면이 정지 상태로 멈춰있게 된다.<br>

<br>

### Global Thread (Background Thread)
iOS의 Framework들은 Background에서 구동되며, 필요한 경우 Main Thread에 Delegate하는 구조이다.<br>
따라서 시간이 오래 걸리는 작업은 직접 Background Thread로 실행시켜주는 것이 좋다.<br>
