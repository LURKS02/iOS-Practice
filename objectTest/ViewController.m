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
    // Do any additional setup after loading the view.
}


- (IBAction)touchDownButton:(id)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Hello, I got it!"
                                 message:@"button touched"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
