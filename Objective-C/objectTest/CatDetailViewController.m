//
//  CatDetailViewController.m
//  objectTest
//
//  Created by 지혜 on 2023/06/15.
//

#import "CatDetailViewController.h"
#import "ComposeViewController.h"
#import "DataManager.h"

@interface CatDetailViewController ()
    <UITableViewDataSource>

@property (strong, nonatomic) NSDateFormatter* formatter;

// table view의 reload를 위하여 outlet 추가
@property (weak, nonatomic) IBOutlet UITableView *catTableView;

- (IBAction)deleteCat:(id)sender;
- (IBAction)share:(id)sender;

@end

@implementation CatDetailViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


// TableView에서 특정 위치의 셀을 요청할 때마다 호출되며, 인덱스 경로(NSIndexPath)를 통해 특정 섹션의 특정 행을 나타낸다.
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 첫 번째 행에 대한 셀을 생성 및 구성
    if (indexPath.row == 0) {
        
        /*
         - dequeueReusableCellWithIdentifier
         UITableView는 많은 양의 데이터를 표시하는 경우에 사용되며, 한번에 모든 셀을 메모리에 로드하면 너무 많은 양의 메모리를 사용하게 된다.
         따라서 사용자가 스크롤하여 화면 밖으로 나간 셀은 메모리에서 제거하고, 화면에 나타나는 셀은 재사용하는 것이 효율적이다.
         이를 위하여 이 코드는 "catDetailCell" 식별자를 가진 셀을 재사용 큐에서 찾아 반환하고, 만약 큐에 해당 식별자의 셀이 없으면 새로운 셀을 생성한다.
         */
        // 식별자가 "catDetailCell"인 재사용 가능한 셀을 dequeue하여 새로운 변수 cell에 할당한다.
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"catDetailCell" forIndexPath:indexPath];
        
        cell.textLabel.text = self.cat.content;
        return cell;
    }
    
    else if (indexPath.row == 1) {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"catDetailDateCell" forIndexPath:indexPath];
        cell.textLabel.text = [self.formatter stringFromDate:self.cat.insertDate];
        return cell;
    }
    
    // 예외적인 상황
    return [[UITableViewCell alloc] init];
}


// 화면 전환(segue)이 발생하기 전에 목적지 뷰 컨트롤러에 필요한 정보를 설정
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // segue.destinationViewController를 통해 목적지 뷰 컨트롤러를 얻는다.
    // 이 목적지 뷰 컨트롤러는 네비게이션 컨트롤러와 같이 자식 뷰 컨트롤러를 가지는 컨테이너 뷰 컨트롤러이다.
    // 해당 뷰 컨트롤러의 자식 뷰 컨트롤러 배열에서 첫번째 요소를 vc에 할당한다.
    ComposeViewController* vc = [[segue.destinationViewController childViewControllers] objectAtIndex: 0];
    
    // ComposeViewController가 작업을 수행할 수 있도록 cat 객체에 대한 정보를 전달한다.
    vc.editTarget = self.cat;
}


// 뷰 컨트롤러의 뷰가 화면에 표시되기 직전에 호출된다. (보통 뷰의 업데이트 / 애니메이션 시작 등의 작업 진행)
- (void)viewWillAppear:(BOOL)animated {
    // 슈퍼클래스에서 정의된 필요한 작업들이 실행된다.
    [super viewWillAppear: animated];
    
    // 테이블 뷰에게 데이터가 변경되었음을 알리고 이에 따라 셀을 다시 로드하도록 요청
    [self.catTableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.dateStyle = NSDateFormatterLongStyle;
    self.formatter.timeStyle = NSDateFormatterMediumStyle;
    self.formatter.locale = [NSLocale localeWithLocaleIdentifier: @"Ko_kr"];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// 특정 객체를 삭제하는 메서드
- (IBAction)deleteCat:(id)sender {
    
    // 알림창 표현 : 알림창의 제목과 메시지
    UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"삭제 확인" message: @"고양이 정보를 삭제할까요?" preferredStyle: UIAlertControllerStyleAlert];
    
    
    // <삭제> 버튼을 나타내기 위한 객체 생성
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"삭제" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        // handler : 버튼이 눌렸을 때 실행될 블록 표현
        
        // 데이터 매니저의 deleteCat으로 현재 객체 정보를 삭제
        [[DataManager sharedInstance] deleteCat: self.cat];
        
        // 현재 뷰 컨트롤러를 닫고 이전 뷰 컨트롤러로 돌아간다.
        [self.navigationController popViewControllerAnimated: YES];
        
        
    }];
    
    // Alert Controller에 액션 추가
    [alert addAction: okAction];
    
    
    // <취소> 버튼을 나타내기 위한 객체 생성
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){}];
    
    
    // Alert Controller에 액션 추가
    [alert addAction: cancelAction];
    
    //알림창을 모달로 표시
    [self presentViewController: alert animated: YES completion:nil];
    
}


// 버튼에서 이벤트가 발생했을 때 호출된다.
- (IBAction)share:(id)sender {
    
    NSString* cat = self.cat.content;
    
    
    // UIActivityViewController : 시스템 공유 시트를 표시하며, 사용자는 이를 통해 다양한 서비스(메시지, 이메일, 트위터, 페이스북 등)로 콘텐츠를 공유할 수 있다.
    // initWithActivityItems : 공유할 항목 설정
    // applicationActivities : 사용자 정의 공유 또는 작업 옵션을 제공하는 UIActivity 객체의 배열을 받고, nil을 전달하면 시스템에서 제공하는 기본 공유 옵션만 사용하게 된다.
    UIActivityViewController* vc = [[UIActivityViewController alloc] initWithActivityItems: @[cat] applicationActivities: nil];
    
    //UIActivityViewController를 모달로 표시
    [self presentViewController: vc animated: YES completion: nil];
    
}

@end
