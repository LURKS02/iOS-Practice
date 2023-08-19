# 백그라운드 화면 마스킹

### App Switcher

사용자가 실행 중인 어플리케이션 사이를 전환하거나, 백그라운드에서 실행 중인 어플리케이션을 종료할 때 사용하는 기능<br>
각 어플리케이션의 미리보기 화면이 카드 방식으로 표시되며, 스크롤하여 다양한 어플리케이션을 확인할 수 있다.<br>
사용자에게 다중 작업 환경을 제공하며, 어플리케이션 간의 전환이나 백그라운드 작업 관리에 유용하다.<br>
iOS에서는 어플리케이션이 백그라운드로 이동할 때 어플리케이션의 스크린샷을 캡쳐하여 App Switcher에서 미리보기로 사용한다.<br>
하지만 민감한 정보가 화면에 표시되어 있을 경우 이러한 동작은 보안 위험을 초래할 수 있다.<br>

따라서 개발자는 이 이벤트를 감지하여, **어플리케이션이 백그라운드로 전환되기 직전에 일시적으로 대체 화면을  표시**하여 (민감한 정보가 포함된) 원래 화면의 내용을 가릴 수 있다.

<br>

1. **SceneDelegate.swift 에서 작업할 경우**
- sceneDidBecomeActive : Active 상태가 되었을 경우
- sceneWillResignActive : App Switcher 모드 (홈 바를 쓸어올리거나 홈 버튼을 두 번 눌렀을 경우)
- sceneWillEnterForeground : 백그라운드 상태였다가 돌아왔을 경우
- sceneDidEnterBackground : 백그라운드 상태로 갔을 경우

2. **AppDelegate.swift 에서 작업할 경우**
- applicationDidBecomeActive
- applicationWillResignActive
- applicationWillEnterForeground
- applicationDidEnterBackground

<br>

```swift
func callBackgroundImage(_ show: Bool) {
  let TAG_BG_IMG = -101
        
  let backgroundView = window?.rootViewController?.view.window?.viewWithTag(TAG_BG_IMG)
        
  if show {
    if backgroundView == nil {
      let backgroundImage = UIView()
      backgroundImage.frame = UIScreen.main.bounds
      backgroundImage.tag = TAG_BG_IMG
      backgroundImage.backgroundColor = .black
                
      let label = UILabel()
      label.frame = UIScreen.main.bounds
      label.textAlignment = .center
      label.font = UIFont.systemFont(ofSize: 30)
      label.textColor = .white
      label.numberOfLines = 0
      label.text = "백그라운드 미리보기"
      backgroundImage.addSubview(label)
                
      window?.rootViewController?.view.window?.addSubview(backgroundImage)
    }
  } else {
    if let backgroundView = backgroundView {
      backgroundView.removeFromSuperview()
    }
  }
}
```

해당 코드를 sceneDidBecomeActive / sceneWillResignActive / sceneWillEnterForeground / sceneDidEnterBackground 등에서 자유롭게 사용한다.

```swift
func sceneDidBecomeActive(_ scene: UIScene) {
        callBackgroundImage(false)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        callBackgroundImage(true)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        callBackgroundImage(false)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        callBackgroundImage(true)
    }
```
