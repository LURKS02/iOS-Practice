# NSPersistentContainer

Core Data 스택의 간단한 설정을 지원하는 클래스<br>
Core Data 스택은 데이터의 저장 및 관리, 쿼리 수행, 데이터 모델 버전 관리 등의 기능을 제공한다.<br>
일반적으로 어플리케이션에서는 하나의 NSPersistentContainer 인스턴스를 가지며, 이를 통해 데이터를 저장하고 불러올 수 있다.<br>

### 내부적으로 관리하는 주요 컴포넌트
#### - NSManagedObjectModel
어플리케이션의 데이터 모델<br>
어플리케이션의 엔티티(Entity), 속성(Attribute), 관계(Relationship), 페치 요청(Fetch Request) 등을 정의한다.<br>

#### - NSPersistentStoreCoordinator
데이터 저장소(Ex. SQLite 데이터베이스)를 관리하는 역할<br>
데이터 저장소와 데이터 모델 간의 인터페이스를 제공한다.<br>

#### - NSManagedObjectContext
데이터의 변경 사항을 관리하고 데이터 저장소와의 상호 작용을 코디네이트 하는 역할<br>
작업 공간으로서, 이 공간에서 데이터를 생성 / 수정 / 삭제할 수 있다.<br>
