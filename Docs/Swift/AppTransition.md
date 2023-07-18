# Scene의 상태 전환

사용자나 시스템이 앱의 Scene을 요청하면 UIKit은 이를 생성하고 Unattached 상태로 둔다.<br>
요청자가 사용자라면 바로 Foreground로 전환하며, 요청자가 시스템이라면 Scene을 Background로 전환하여 이벤트를 처리할 수 있도록 한다.<br>

사용자가 앱의 UI를 닫으면 UIKit은 Scene을 Background로 전환하고, 곧 Suspended 상태로 전환한다.<br>
UIKit은 Background, Suspended 상태의 앱은 언제든지 연결을 끊고 Unattached 상태로 전환할 수 있다.<br>

<img width="604" alt="R1280x0-4" src="https://github.com/LURKS02/iOS-Practice/assets/63408930/1ff6a3f3-82b5-4bdc-bc7a-b77169887a46">

1. UIKit이 Scene을 앱에 연결하면 Scene의 초기 UI를 구성하고 Scene에 필요한 데이터를 로드한다.<br>
2. Foreground 상태로 전환할 때 UI를 구성하고 사용자 상호작용을 준비한다.<br>
3. Foreground -> Background 상태로 전환할 때 데이터를 저장하고 앱의 동작을 최소화한다.<br>
4. Background로 전환되면 중요한 작업을 완료하고 메모리를 많이 확보하여 App Snapshot을 준비한다.<br>
5. Scene 연결이 끊어지면 연관되어있던 모든 리소스를 정리한다.<br>


### iOS12 이전의 상태 전환

iOS12까지는 UIApplicationDelegate에서 모든 Life Cycle 이벤트를 처리하였다.<br>
이때 발생하는 상태 전환은 다음과 같다. (Scene을 사용하지 않았을 경우의 상태 전환)<br>

#### App Transition

<img width="555" alt="R1280x0-5" src="https://github.com/LURKS02/iOS-Practice/assets/63408930/92873652-3e66-4ec3-8259-225fd49f3d56">

1. 시작 시 앱의 자료구조와 UI를 초기화한다.<br>
2. Active 상태가 되면 UI 구성을 완료하고 사용자와 상호작용할 준비를 한다.<br>
3. Deactivation이 되면 데이터를 저장하고 앱 동작을 최소화한다.<br>
4. Background 상태가 되면 중요한 작업을 완료하고 메모리를 최대한 확보한 뒤 Snapshot을 준비한다.<br>
5. 앱이 종료되면 작업을 즉시 중지하고 공유 자원을 해제한다.<br>

이때 Foreground 앱이 Background로 전환되는 시점은 다음과 같다.<br>
- 시스템 이벤트로 인해 일시 중지된 앱<br>
- 다른 앱이 시작될 경우<br>
- 사용자가 홈 화면으로 돌아오는 경우<br>

UIKit에서는 다음의 경우에만 Background 앱에 실행 시간을 할당한다.<br>
- AirPlay, Picture in Picture (비디오를 사용한 오디오 통신)
- 사용자 위치 서비스
- Voice over IP
- 외부 악세사리와의 통신
- 블루투스 LE(Low Energy)와 통신, 혹은 디바이스를 블루투스 LE 악세사리로 변환
- 서버에서의 정기적인 업데이트
- Apple Push Notification 지원

