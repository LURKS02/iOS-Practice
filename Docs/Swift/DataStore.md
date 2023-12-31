# 데이터 저장소

앱의 콘텐츠나 데이터를 저장하고 보관하는 특별한 객체<br>
앱에서 생성된 정보를 영구적으로 저장하고 나중에 검색하거나 사용할 수 있도록 한다.<br>

## UserDefaults
키-값 쌍으로 저장하는 인터페이스로, 런타임시 개체를 이용하여 기본 데이터베이스에서 사용하는 기본값을 읽어오기 때문에 값이 필요할 때마다 데이터베이스를 열 필요가 없다.<br>
대용량의 데이터보다는 자동로그인 여부, 아이디, 환경설정에서의 설정 데이터 값과 같은 단일 데이터 등을 보관한다.<br>

## CoreData
iOS Framework로, 테이블을 이용하지 않고 객체를 생성하여 데이터를 운영하기에 더 많은 저장공간과 메모리를 필요로 한다.<br>
Data Model을 생성한 후 Entity를 생성하며, 빠르게 데이터를 가져올 수 있다.<br>
객체 그래프 관리와 버전 관리가 가능하다.<br>

## SQLite
Swift에는 특별한 설치 없이 사용할 수 있으며, C언어로 작성되어 매우 가볍고, 전체 데이터베이스를 디스크 파일 1개에 저장한다.<br>
직접 SQL 쿼리를 작성하여 세밀한 데이터 제어가 가능하다.<br>
설정 자체가 매우 간편하여 관리하기가 수월하고, iOS, Android, Linux, Window와 같은 다양한 운영체제에서 사용될 수 있다.<br>
수많은 프로세스와 쓰레드의 접근으로부터 안전하다.<br>

## Realm
SQLite와 같이 오픈소스이며, 모바일에 최적화된 라이브러리이다.<br>
SQLite, Core Data보다 속도가 빠르고 성능면에서 더 우수하다.<br>
많은 작업들을 처리하기 위해 코드가 많이 필요하지 않으며, 메인 스레드에서 데이터의 읽기/쓰기 작업을 모두 할 수 있어 편리하다.<br>
대용량의 데이터에 대해 무료로 사용할 수 있으며, 용량이 적고 큼에 상관없이 속도와 성능이 유지된다.<br>
