# SQL Injection
공격자가 악의적인 의도를 갖는 구문을 삽입하여 원하는 SQL을 실행하도록 하는 웹 해킹 기법<br>
```swift
SELECT * FROM USER WHERE ID = ‘INPUT1’ AND PASSWORD = ‘INPUT2’
SELECT * FROM USER WHERE ID = ‘ ‘ OR 1=1 —INPUT1’ AND PASSWORD = ‘INPUT2’
```
INPUT으로 ‘OR 1=1—을 넣으면 뒷내용이 주석처리되고, where문은 항상 참이 된다.<br>
이를 방지하기 위해 특수문자 및 SQL 예약어들을 필터링하거나, SQL 오류 메시지를 노출하지 않는 등의 방법이 필요하다.<br>

