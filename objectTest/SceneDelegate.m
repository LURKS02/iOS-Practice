//
//  SceneDelegate.m
//  objectTest
//
//  Created by 지혜 on 2023/06/08.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end




@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // 앱이 Scene과 연결될 때 호출되는 메서드
    // Scene과 관련된 초기화 작업을 처리한다.
    
    // 1. Scene이 생성되면서 화면을 구성하고 초기화하는 작업을 수행 (뷰 컨트롤러를 인스턴스화 하거나 인터페이스 요소를 설정)
    // 2. Scene에 필요한 데이터를 로드하고, 데이터 모델을 초기화하거나 이전 상태를 복원하는 작업을 진행
    // 3. Scene에 대한 추가적인 설정 수행 (Scene을 관리하는 뷰 컨트롤러를 설정하거나 인터페이스 스타일을 지정하는 등)
    // 4. Scene과 관련된 사용자 인터페이스를 초기화하고, 필요한 이벤트 처리기를 등록하거나 사용자 인터렉션에 대한 준비 수행
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // 시스템에 의해 Scene이 해제되는 시점에 호출되는 메서드
    // Scene이 백그라운드로 전환되거나 세션이 삭제될 때 리소스를 관리하는데 도움을 주는 메서드
}



- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Scene이 비활성 상태에서 활성 상태로 전환된 후 호출되는 메서드
    // 일시 중단되었거나 아직 시작하지 않은 작업을 다시 시작할 수 있음.
    
    // 1. 타이머를 다시 시작
    // 2. 애니메이션을 시작하거나 화면 갱신 수행
    // 3. 백그라운드에서 동작하던 작업을 다시 시작
    // 4. 네트워크 요청을 재개하고 데이터를 업데이트
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Scene이 비활성 상태로 전환되기 직전에 호출되는 메서드
    
    // 앱이 포그라운드 -> 백그라운드로 전환되어 Scene이 비활성 상태로 전환되거나
    // 다른 앱이 활성화되어 현재 앱의 Scene이 일시 중단되어 비활성 상태로 전환되거나
    // 앱이 종료되기 전에 Scene이 비활성 상태로 전환되는 경우 호출
    
    // 메서드의 역할
    // 1. 비활성 상태로 전환되기 전에 일시 중단된 작업을 처리하거나 일시 중단된 상태를 저장
    // 2. 비활성 상태로 전환되기 전에 임시적으로 사용되는 데이터를 저장하여 이후 활성 상태로 전환되었을 때 복원에 도움을 줌 (사용자 입력, 상태 변경 등)
    // 3. 비활성 상태로 전환되기 전에 사용자 경험을 관리하기 위한 조치가 가능 (앱이 백그라운드로 전환되면서 사용자에게 경고를 표시하거나 인터페이스를 조정하는 등)
    
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Scene이 포그라운드로 전환되기 직전에 호출되는 메서드
    
    // 앱이 백그라운드 -> 포그라운드로 전환되어 Scene이 다시 활성 상태로 전환되거나
    // 다른 앱이 종료되어 현재 앱의 Scene이 다시 활성 상태로 전환되는 경우 호출
    
    // 메서드의 역할
    // 1. 활성 상태로 전환될 때, 이전 상태에 대한 업데이트 작업을 수행 (변경된 데이터를 가져와 화면을 다시 업데이트하거나 알림을 확인하고 처리하는 등)
    // 2. 활성 상태로 전환될 때, 사용자 인터페이스를 초기화하고 필요한 이벤트 처리기 등록 (버튼 탭이나 제스처 인식과 같은 사용자 입력을 다시 활성화)
    // 3. Scene이 포그라운드로 전환될 때, 일시 중단되었던 작업을 재개 (타이머를 다시 시작하거나 애니메이션을 재개하는 등)
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Scene이 백그라운드로 전환된 직후에 호출되는 메서드
    
    // 앱이 포그라운드 -> 백그라운드로 전환되어 Scene이 비활성 상태로 전환되거나
    // 앱이 종료되기 전에 Scene이 비활성 상태로 전환되는 경우 호출
    
    // 메서드의 역할
    // 1. Scene이 백그라운드로 전환되기 전에 백그라운드 작업 준비 (파일 저장, 데이터 동기화, 네트워크 요청 등의 작업을 수행하여 중요한 데이터의 유실 방지)
    // 2. Scene이 백그라운드로 전환되기 전에 앱의 상태 저장 (사용자 데이터, 설정 값, 임시적인 상태 등 저장)
    // 3. Scene이 백그라운드로 전환되기 전에 사용자 인터페이스 정리, 필요한 데이터를 저장하거나 사용자 입력을 중지 (임시 데이터를 저장하고 편집중인 내용을 저장/취소)
}


@end
