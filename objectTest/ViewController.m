//
//  ViewController.m
//  objectTest
//
//  Created by 지혜 on 2023/06/08.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     
     UIViewController의 뷰가 메모리에 로드된 직후에 호출되는 시점에 실행
     뷰 컨트롤러의 초기화 작업이나 뷰의 구성, 데이터 로딩 등의 작업 수행
     
     실행되는 시나리오 
     1. UIViewController의 뷰가 처음으로 로드될 때
     2. UIViewController가 화면에 표시되기 전에 메모리에 로드되었던 뷰가 다시 표시될 때 (ex. 다른 화면으로 이동한 후 되돌아올 때)
     
     메서드의 역할
     1. 뷰 컨트롤러의 인스턴스 변수나 속성을 초기화하는 작업을 수행
        (데이터 모델을 초기화하거나 필요한 객체를 인스턴스화하는 등)
     2. 뷰 컨트롤러의 뷰를 구성하고 설정
        (인터페이스 요소를 인스턴스화하거나 제약 조건을 설정하는 등)
     3. 뷰 컨트롤러에 표시할 데이터를 로드하고, 이를 뷰에 반영
        (네트워크 요청을 통해 데이터를 가져오거나, 로컬 데이터베이스에서 데이터를 조회)
     4. 뷰 컨트롤러와 관련된 사용자 인터페이스 요소를 초기화하고 설정
        (버튼 탭 이벤트에 대한 액션 메서드를 등록하거나, 테이블 뷰의 데이터 소스와 델리게이트를 설정하는 등)
     
     */
    
}


- (IBAction)touchDownButton:(id)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Hello, I got it!"
                                 message:@"button touched"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
