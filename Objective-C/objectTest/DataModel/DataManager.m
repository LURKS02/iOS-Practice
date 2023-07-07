//
//  DataManager.m
//  objectTest
//
//  Created by 지혜 on 2023/06/16.
//

#import "DataManager.h"
#import "objectTest-Swift.h"

@implementation DataManager

// 싱글턴 패턴으로 DataManager 클래스의 공유 인스턴스를 반환
// 처음 호출되면 dispatch_once 함수를 통해 스레드 안전하게 단 한번만 DataManager 인스턴스를 생성하고, 이후에는 이 생성된 인스턴스를 반환
// 어플리케이션 전체에서 단일한 DataManager 인스턴스를 공유하여 사용할 수 있다.
+ (instancetype) sharedInstance {
    
    static DataManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    // dispatch_once : 이 함수 내 코드 블럭을 어플리케이션 실행 동안 단 한번만 실행하도록 보장하는 역할
    // 여러 스레드에서 동시에 sharedInstance 메서드를 호출하더라도 DataManager 인스턴스는 한번만 생성되도록 보장함
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataManager alloc] init];
        sharedInstance.catList = [[NSMutableArray alloc] init];
    });
    
    return sharedInstance;
    
}

// Core Data에서 Cat 엔티티의 모든 인스턴스를 검색하고, 결과를 catList 프로퍼티에 저장
- (void)fetchCat {
    
    // 데이터를 조회하기 위한 request 객체 생성, Cat 엔티티 요청
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName: @"Cat"];
    
    // 결과 정렬 방식 설정
    NSSortDescriptor* sortByDateDesc = [NSSortDescriptor sortDescriptorWithKey: @"insertDate" ascending: NO];
    request.sortDescriptors = @[sortByDateDesc];
    

    NSError* error = nil;
    
    // fetch를 실행하고 결과를 result 배열에 저장
    NSArray* result = [self.mainContext executeFetchRequest: request error: &error];
    
    // setArray 메서드를 호출하여 검색 결과를 catList 프로퍼티에 저장
    [self.catList setArray: result];
    
}

// 새로운 Cat 객체를 만들어 Core Data에 저장
- (void)addNewCat: (NSString*) cat {
    Cat* newCat = [[Cat alloc] initWithContext: self.mainContext];
    newCat.content = cat;
    newCat.insertDate = [NSDate date];
    
    // NSManagedObject의 변경 사항을 저장
    [self saveContext];
}

// Cat 객체를 Core Data에서 삭제
- (void)deleteCat: (Cat*) cat {
    if (cat != nil) {
        
        // 주어진 객체를 관리하는 context에서 해당 객체 삭제
        [self.mainContext deleteObject: cat];
        [self saveContext];
    }
}


- (NSManagedObjectContext*)mainContext {
    return self.persistentContainer.viewContext;
}


// persistentContainer 속성에 대한 getter / setter 가 생성되며, 이들은 _persistentContainer 라는 인스턴스 변수를 사용한다.
@synthesize persistentContainer = _persistentContainer;

// persistentContainer 속성의 getter 메서드를 직접 지정
- (NSPersistentContainer *)persistentContainer {
    
    // self를 lock하고 임계 구역(critical section) 설정
    // 즉, 한번에 하나의 스레드만이 이 코드 블럭을 실행할 수 있음
    // 여러 스레드가 동시에 core data 스택을 초기화하려는 상황을 방지하여 데이터 충돌이나 불일치를 예방
    @synchronized (self) {
        if (_persistentContainer == nil) {
            
            // 저장소 "CatModel" 생성
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CatModel"];
            
            // 영구 저장소(디스크의 실제 파일, entity 인스턴스) 로드
            // 어플리케이션에서 저장소를 사용할 수 있도록 준비하고, 저장된 데이터를 메모리에 불러옴
            [_persistentContainer loadPersistentStoresWithCompletionHandler: ^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    return _persistentContainer;
}


- (void)saveContext {
    
    // viewContext : NSPersistentContainer가 제공하는 main queue context로 UI 업데이트 등의 작업에 주로 사용
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    
    // hasChanges : context에 변경된 사항이 있는지 체크
    // save : 변경 사항이 있을 경우 영구적으로 저장, 오류가 발생하면 error에 오류 저장
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
