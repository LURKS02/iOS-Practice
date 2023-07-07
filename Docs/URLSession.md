# URLSession

HTTP를 포함한 몇 가지의 프로토콜을 지원하고, 인증, 쿠키/캐시 관리 등을 지원하는 API<br>
Request와 Response를 기본 구조로 가진다.<br>
- Request : URL 객체를 통해 직접 통신하는 형태 / URLRequest 객체를 만들어서 옵션을 설정하여 통신하는 형태<br>
- Response : 설정된 Task의 Completion Handler 형태로 response 수신 / URLSessionDelegate를 통해 지정된 메소드를 호출하는 형태로 response 수신<br>
일반적으로 간단한 response를 작성할 때는 Completion Handler를 사용하지만, 어플리케이션이 background로 들어갈 때도 파일 다운로드를 지원하도록 하거나, 인증 및 캐싱을 default 옵션으로 사용하지 않는 상황 등의 경우에는 Delegate 패턴을 이용해야 한다.<br>

<br>

### URLSession Life Cycle
1. Session configuration 을 설정하고 Session을 생성
2. 통신할 URL 및 Request 객체를 설정
3. 사용할 Task를 결정하고 그에 맞는 Completion Handler 또는 Delegate 메소드를 작성
4. Task를 실행
5. Task가 완료된 후 Completion Handler가 실행됨

<br>

### Session의 종류
1. Shared Session : singleton으로 만들어진 Session으로, Configuration을 따로 하지 않고 사용할 수 있다. 따라서 Session 설정을 할 수는 없지만 간단하게 데이터 통신을 해야할 때 사용한다.<br>
2. Default Session : 기본적인 Session으로 캐시, 쿠키, 자격 증명 등을 디스크에 저장하는 세션. Delegate를 설정해서 데이터 통신 진행상황을 확인할 수 있다.<br>
3. Ephemeral Session : Default Session과 유사하지만 캐시, 쿠키, 인증 정보 등을 디스크에 저장하지 않는다.<br>
4. Background Session : 어플리케이션이 종료된 후에도 통신이 이루어지는 것을 지원하는 세션<br>

<br>

### URLRequest
서버로 요청을 보낼 때 데이터의 캐싱 방식, 사용할 HTTP 메소드 (Get, Post 등), 전송할 내용 등을 설정할 수 있다.<br>

<br>

### Task
Session 객체가 서버로 요청을 보낸 후, 응답을 받을 때 URL 기반의 내용들을 받는 역할 (retrieve)<br>
1. Data Task : Data 객체(NSData)를 통해 데이터를 주고받는 Task<br>
2. Download Task : data를 파일 형태로 전환하여 다운로드받는 Task로, 백그라운드 다운로드를 지원한다.<br>
3. Upload Task : data를 파일 형태로 전환하여 업로드하는 Task<br>
* URLSession과 같은 네트워킹용 API는 일반적으로 어플리케이션 전역에서 사용되므로, ViewController에 메소드를 작성하기보다는 하나의 모듈(Class)을 만들고 그 안에 static 함수들을 만들어 사용하는 것이 좋다.<br>
