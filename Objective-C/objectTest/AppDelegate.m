//
//  AppDelegate.m
//  objectTest
//
//  Created by 지혜 on 2023/06/08.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

/*
 
 앱 로딩 프로세스
 
 앱 객체가 생성되는 것을 시작으로, 앱 구동에 필요한 delegate, window, view, view controller들을 로딩 및 초기화
 이들 간의 유기적인 관계를 재구성하여 GUI 동작에 필요한 런루프를 생성하는 등의 작업이 진행됨
 
 AppDelegate의 역할
 
 앱 객체(Instance)의 대리인 역할을 수행
 앱 객체 클래스를 직접 서브 클래싱(기존 클래스를 상속받아 새로운 클래스 생성) 하지 않고 delegate를 통해 처리
 앱의 상태 변화(비활성화, 잠자기, 저장된 상태로부터 복구, 디바이스 회전에 따라 화면 전환 결정 여부 등)에 대하여 감지
 
 */


@implementation AppDelegate

// 앱 프로세스 완료 및 앱 실행 실시
// 앱이 실행 준비를 거의 마쳤을 때 호출되며, 앱에 필요한 크리티컬한 데이터의 초기화 진행
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    sleep(1);
        return YES;
}

#pragma mark - UISceneSession lifecycle

// Scene 을 만들기 위한 구성 객체 반환 : 스토리보드 / info
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

// 유저가 Scene session을 해제할 때 실시
- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
}

@end
