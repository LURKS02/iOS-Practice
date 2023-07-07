//
//  DataManager.h
//  objectTest
//
//  Created by 지혜 on 2023/06/16.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <objectTest-Swift.h>


NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject



// Core Data 스택을 지원하는 클래스
@property (readonly, strong) NSPersistentContainer *persistentContainer;

// Core Data에서 변경사항을 영구적으로 저장
- (void)saveContext;

// DataManager의 공유 인스턴스
+ (instancetype) sharedInstance;

// 데이터 변경 사항을 관리하는 작업공간으로, 데이터의 생성 / 수정 / 삭제가 가능하다.
@property (readonly, strong) NSManagedObjectContext* mainContext;




@property (strong, nonatomic) NSMutableArray* catList;

// Core Data에서 Cat 엔티티의 모든 인스턴스를 검색하고, 결과를 catList 프로퍼티에 저장
- (void)fetchCat;
// 새로운 Cat 객체를 만들어 Core Data에 저장
- (void)addNewCat: (NSString*) cat;
// Cat 객체를 Core Data에서 삭제
- (void)deleteCat: (Cat*) cat;

@end

NS_ASSUME_NONNULL_END
