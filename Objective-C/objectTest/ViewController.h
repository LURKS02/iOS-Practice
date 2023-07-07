//
//  ViewController.h
//  objectTest
//
//  Created by 지혜 on 2023/06/08.
//

#import <UIKit/UIKit.h>

/*
 
 1. 클래스 메서드
 헤더 파일에 선언시 다른 클래스에서도 호출 및 사용 가능
 [클래스명 메소드명]; 으로 구현부에서 사용
 
 2. 인스턴스 메서드
 헤더 파일에 선언 후 구현부에서 호출 및 사용 가능
 헤더 파일에 선언 없이 구현부에서 즉시 선언 및 구현, 사용 가능
 [self 메서드명]; 으로 구현부에서 사용
 다른 클래스에서 사용하기 위해서는 객체 생성 후 메서드를 호출하여 사용 (alloc)
 
 */

@interface ViewController : UIViewController

- (IBAction)touchDownButton:(id)sender;

@end

