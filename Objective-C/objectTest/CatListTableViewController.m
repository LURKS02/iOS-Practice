//
//  CatListTableViewController.m
//  objectTest
//
//  Created by 지혜 on 2023/06/15.
//

#import "CatListTableViewController.h"
#import "Cat.h"
#import "CatDetailViewController.h"
#import "DataManager.h"

@interface CatListTableViewController ()

@property (strong, nonatomic) NSDateFormatter* formatter;

@end

@implementation CatListTableViewController

// UITableView 셀 중 하나를 선택했을 때 특정 뷰 컨트롤러로 데이터를 전달하는 작업 수행 (Segue)
// segue가 실행되기 직전에 호출되며, 목적지 뷰 컨트롤러로 데이터를 전달한다.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // 선택된 셀의 인덱스 경로를 찾는다.
    // sender는 선택된 셀을 가리키며, UITableViewCell로 캐스팅하여 indexPathForCell 메서드에 전달한다.
    NSIndexPath* indexPath = [self.tableView indexPathForCell:(UITableViewCell*)sender];
    
    // 인덱스 경로가 유효한 경우 (선택된 셀이 있는 경우)
    if (indexPath != nil) {
        
        // DataManager 싱글톤 객체에서 목록을 가져와 선택된 셀의 행 번호에 해당하는 객체를 타겟으로 설정한다.
        Cat* target = [[[DataManager sharedInstance] catList] objectAtIndex:indexPath.row];
        
        // segue의 목적지 뷰 컨트롤러를 CatDetailViewController로 캐스팅하여 vc에 저장한다.
        // segue.destinationViewController는 목적지 뷰 컨트롤러를 가리키는 속성이며, 속성 타입은 UIViewController이다.
        // 이때 CatDetailViewController는 UIViewController를 상속받은 고유 뷰 컨트롤러이므로, Cat 인스턴스를 설정하려면 캐스팅이 필요하다.
        CatDetailViewController* vc = (CatDetailViewController*)segue.destinationViewController;
        
        // vc의 프로퍼티에 타겟 객체를 설정하여 CatDetailViewController로 데이터를 전달한다.
        vc.cat = target;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    [[DataManager sharedInstance] fetchCat];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.dateStyle = NSDateFormatterLongStyle;
    self.formatter.timeStyle = NSDateFormatterNoStyle;
    self.formatter.locale = [NSLocale localeWithLocaleIdentifier: @"Ko_kr"];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DataManager sharedInstance] catList] count];
}

// 테이블 뷰의 각 셀에 대한 정보를 설정하는 메서드
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // "catCell"식별자를 가진 UITableViewCell 객체를 재사용하거나 새로 생성한다.
    // 대용량 데이터를 표시할 때는 성능 최적화를 위해 화면에 보이지 않는 셀을 재사용하기도 한다.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"catCell" forIndexPath:indexPath];
    
    
    // DataManager 싱글톤에서 catList를 가져오고, 그 중 indexPath.row에 해당하는 Cat 객체 target을 가져온다.
    // 이 Cat 객체는 현재 셀에서 표시해야 하는 데이터를 담고 있다.
    Cat* target = [[[DataManager sharedInstance] catList] objectAtIndex:indexPath.row];
    
    // 해당 cell의 textLabel과 detailTextLabel 값을 가져온 target 객체를 기반으로 설정한다.
    cell.textLabel.text = target.content;
    cell.detailTextLabel.text = [self.formatter stringFromDate: target.insertDate];
    
    
    return cell;
}


// 테이블 뷰에서 특정 셀의 편집 가능 여부를 결정
// 테이블 뷰의 데이터 소스를 위한 프로토콜인 UITableViewDataSource에 선언되어 있다.
// tableView : 이 메서드를 호출한 테이블 뷰 객체를 참조
// indexPath : 테이블 뷰에서의 특정 위치를 표현
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // YES를 반환하면 해당 셀은 편집 가능한 상태가 되고, NO를 반환하면 해당 셀은 편집이 불가능하게 된다.
    // 본 코드에서는 모든 행이 편집 가능하도록 항상 YES를 반환한다.
    return YES;
}


// 테이블 뷰의 특정 행에 대해 어떤 편집 스타일을 사용할지 결정
// 테이블 뷰가 특정 위치의 행에 대한 편집 스타일을 요청할 때 호출되는 메서드이다.
// 메서드의 반환 값은 UITableViewCellEditingStyle 열거형 타입으로, 테이블 뷰의 행 편집 스타일을 결정한다.
//예시
/*
 1. UITableViewCellEditingStyleNone: 편집 모드에도 행의 왼쪽에 빨간 원이 나타나지 않는다.
 2. UITableViewCellEditingStyleDelete: 행을 왼쪽으로 스와이프하거나 편집 모드로 진입할 때 행의 왼쪽에 빨간 원이 나타나며, 이 원을 탭하면 Delete 버튼이 나타난다.
 3. UITableViewCellEditingStyleInsert: 행을 왼쪽으로 스와이프하거나 편집 모드로 진입할 때 행의 왼쪽에 녹색 원이 나타나며, 이 원을 탭하면 Insert 버튼이 나타난다.
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}



// 테이블 뷰의 특정 행에서 특정 편집 동작이 실행되면 그에 따른 조치를 수행하며, 사용자가 테이블 뷰의 특정 행의 편집 동작을 커밋하려고 할 때 호출된다.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // editing style이 delete인 경우
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        /*
         1. DataManager의 싱글턴 인스턴스에서 객체 목록을 가져와 사용자가 선택한 행에 해당하는 객체를 가져온다.
         2. 내부 저장소에서 해당 객체를 삭제한다.
         3. 싱글턴 인스턴스의 목록에서 해당 객체를 삭제한다.
         4. 테이블 뷰에서 해당 행을 애니메이션과 함께 제거한다.
         */
        Cat* target = [[DataManager sharedInstance] catList][indexPath.row];
        [[DataManager sharedInstance] deleteCat: target];
        [[[DataManager sharedInstance] catList] removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    // editing style이 insert인 경우
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
