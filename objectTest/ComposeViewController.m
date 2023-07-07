//
//  ComposeViewController.m
//  objectTest
//
//  Created by 지혜 on 2023/06/15.
//

#import "ComposeViewController.h"
#import "Cat.h"
#import "DataManager.h"

@interface ComposeViewController ()

- (IBAction)close:(id)sender;

- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *catTextView;

@property (strong, nonatomic) id willShowToken;
@property (strong, nonatomic) id willHideToken;


@end

@implementation ComposeViewController


// 객체가 메모리에서 제거되기 직전에 호출되어, 해당 객체가 점유하고 있던 리소스를 해제하거나 정리하는데 사용된다.
- (void) dealloc {
    
    // willShowToken과 willHideToken 프로퍼티가 가리키는 옵저버를 NSNotificationCenter에서 제거한다.
    // 즉, ComposeViewController 객체가 메모리에서 해제되기 전에 해당 객체가 등록했던 모든 옵저버를 제거한다.
    // 이를 통해 메모리 누수를 방지하고, 이미 메모리에서 제거된 객체에 대한 통지를 받는 것을 방지할 수 있다.
    if (self.willShowToken) {
        [[NSNotificationCenter defaultCenter] removeObserver: self.willShowToken];
    }
    if (self.willHideToken) {
        [[NSNotificationCenter defaultCenter] removeObserver: self.willHideToken];
    }
}



// 뷰 컨트롤러의 뷰가 화면에 보여지기 직전에 호출된다. (화면을 이동하는 경우에도 다시 호출됨)
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    // 최초 응답자(first responder) : 화면이 보여질 때 catTextView가 제일 먼저 활성화되어 사용자 입력을 받을 수 있도록 한다.
    [self.catTextView becomeFirstResponder];
}

// 뷰 컨트롤러의 뷰가 화면에서 사라지기 직전에 호출된다.
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    
    // catTextView가 최초 응답자 상태를 포기하도록 한다.
    [self.catTextView resignFirstResponder];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 기존의 객체를 편집하는 경우
    if (self.editTarget != nil) {
        self.navigationItem.title = @"고양이 편집";
        self.catTextView.text = self.editTarget.content;
        
    // 새로운 객체를 생성하는 경우
    } else {
        self.navigationItem.title = @"새 고양이";
        self.catTextView.text = @"";
    }
    
    
    // 키보드가 화면에 표시될 때 (UIKeyboardWillShowNotification) 발생하는 알림을 구독
    // 알림이 발생하면 usingBlock: 에 전달된 블록이 실행된다.
    self.willShowToken = [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        // 알림 객체(note)의 userInfo 딕셔너리에서 UIKeyboardFrameEndUserInfoKey 를 사용하여 키보드의 최종 프레임을 가져온다.
        // 이 프레임의 height는 <키보드의 높이>를 나타낸다.
        CGFloat height = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        
        
        // contentInset은 스크롤 가능한 컨텐츠가 UIScrollView 또는 이를 상속받은 클래스의 경계 내에서 렌더링되는 영역의 여백을 설정하는데 사용된다.
        UIEdgeInsets inset = self.catTextView.contentInset;
        
        // 콘텐츠의 하단 여백이 키보드의 높이만큼 늘어난다.
        inset.bottom = height;
        self.catTextView.contentInset = inset;
        
        
        // scrollIndicatorInsets는 스크롤 표시기가 렌더링되는 영역의 여백을 설정하는데 사용된다.
        inset = self.catTextView.scrollIndicatorInsets;
        
        // 스크롤 인디케이터의 하단 여백이 키보드의 높이만큼 늘어난다.
        inset.bottom = height;
        self.catTextView.scrollIndicatorInsets = inset;
        
    }];
    
    
    
    // 키보드가 화면에서 사라질 때 (UIKeyboardWillHideNotification) 발생하는 알림을 구독
    // 알림이 발생하면 usingBlock: 에 전달된 블록이 실행된다.
    self.willHideToken = [[NSNotificationCenter defaultCenter] addObserverForName: UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        // 텍스트 뷰의 contentInset을 원래대로 복구
        UIEdgeInsets inset = self.catTextView.contentInset;
        inset.bottom = 0;
        self.catTextView.contentInset = inset;
        
        // 텍스트 뷰의 scrollIndicatorInsets을 원래대로 복구
        inset = self.catTextView.scrollIndicatorInsets;
        inset.bottom = 0;
        self.catTextView.scrollIndicatorInsets = inset;
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// 사용자가 저장 버튼을 눌렀을 때 실행되는 작업을 정의
- (IBAction)save:(id)sender {
    
    // 현재 텍스트뷰에 입력된 텍스트를 객체에 할당
    NSString* cat = self.catTextView.text;
    
    // editTarget이 nil이 아닌 경우, 즉 사용자가 기존 객체를 편집하고 있는 경우
    // editTarget(선택했던 Cat)을 수정하고 저장한다.
    if (self.editTarget != nil) {
        self.editTarget.content = cat;
        [[DataManager sharedInstance] saveContext];
        
    // editTarget이 nil인 경우, 즉 새로운 객체를 생성하는 경우
    // addNewCat으로 새로운 객체 추가
    } else {
        [[DataManager sharedInstance] addNewCat: cat];
    }
    
    // 애니메이션과 함께 모달 뷰 컨트롤러를 닫는다.
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)close:(id)sender {
    
    [self dismissViewControllerAnimated: YES completion: nil];
    
}
@end
