# Core Data

Apple에서 제공하는 데이터 관리 프레임워크<br>
데이터를 유지 및 캐싱할 수 있고, Cloudkit을 사용하여 여러 장치에 데이터를 동기화하는 것이 가능하다.<br>
내부적으로 SQLite를 사용하여 데이터베이스처럼 사용 가능하지만, 코어 데이터 자체로 데이터베이스라기 보다는 SQLite에 데이터를 저장하고 관리하는 프레임워크라고 할 수 있다.<br>

<br>

## Core Data Stack
Core Data의 핵심으로, 앱의 모델 layer를 관리하고 유지하는 역할을 한다.<br>

### NSManagedObjectModel
Entity를 설명하는 데이터베이스 스키마<br>
ManagedObject의 Structure를 정의한다.<br>

<br>

### NSPersistentStoreCoordinator
Persistent Storage(영구 저장소)와 Managed Object Model을 연결한다.<br>

<br>

### NSManagedObjectContext
Transaction으로, Managed Object를 생성하고, 저장하고, 가져오는 (fetch) 작업을 제공한다.<br>

<br>

### NSPersistentContainer
Core Data Stack을 나타내는 필요한 모든 객체를 포함한다.<br>

<br>

## Codegen 설정
Core Data와 관련한 코드를 자동으로 생성할지, 수동으로 만들어줄지를 결정하기 위한 설정<br>

<br>

### Class Definition
기본 설정으로 Data, Entities, Attributes를 자동으로 Class화 시켜주고 Property화 시켜준다.<br>
Core Data Class / Core Data Properties를 자동으로 만들어 관리하므로, 개발자가 해당 파일을 볼 수 없어 커스텀 코드를 추가할 수 없다.<br>

```swift
// Class 파일
public class MyData: NSManagedObject {
}
```
```swift
// Properties 파일
extension MyData {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<MyData> {
		return NSFetchRequest<MyData>(entityName: "MyData")
	}

	@NSManaged public var done: Bool
	@NSManaged public var title: String?
}

extension MyData: Identifiable {
}
```

<br>

### Category / Extension
Core Data Class파일만 만들어주고, Core Data Properties 파일은 자동으로 관리한다.<br>
이후 Core Data Persistent Container에 대한 참조를 얻으며, persistent container로부터 managed object context를 얻는다.<br>
이를 통해 객체를 생성하고 코어 데이터에 저장할 수 있다.<br>

<br>

### Manual / None
하나의 Entity에 대하여 Core Data Class파일과 Core Data Properties파일을 만든다.<br>

- Core Data Class
Entity를 표현하는 클래스<br>
생성된 클래스는 코어 데이터가 serialize / deserialize 할 수 있도록 자동으로 NSManagedObject를 상속한다.
코어 데이터는 이 클래스를 저장하거나, 필요할 때 가져올 수 있다.<br>
- Core Data Properties
Core Data Class의 Extension으로, Attribute들을 프로퍼티로 가지고 있다.<br>
fetchRequest() 메소드를 가진다.<br>

<br>
