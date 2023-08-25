## Toast

사용자에게 간단한 메시지나 알림을 표시하기 위하여 사용되는 작은 팝업 형태의 UI 요소

안드로이드에서는 라이브러리로 제공하는 기능이지만, iOS에서는 지원하지 않아 직접 구현해야 한다.

```jsx
@objc func showToast() {
        guard let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else { return }
        
        let toastWindow = UIWindow(windowScene: scene)
        toastWindow.windowLevel = .alert + 1
        toastWindow.rootViewController = UIViewController()
        toastWindow.isHidden = false
        toastWindow.isUserInteractionEnabled = false
        
        let messageLabel = UILabel()
        messageLabel.text = "나는 토스트다."
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 12)
        messageLabel.textColor = .white
        messageLabel.backgroundColor = UIColor(white: 0, alpha: 0.5)
        messageLabel.layer.cornerRadius = 10
        messageLabel.clipsToBounds = true
        toastWindow.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(100)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1, animations: {
                messageLabel.alpha = 0
            }) { (_) in
                messageLabel.removeFromSuperview()
                toastWindow.isHidden = true
            }
        }
    }
```

iOS 13 이후로 어플리케이션의 life cycle이 UIScene을 기반으로 변화하면서 UIWindow를 생성하여 직접 표시하려면 기존과 다른 방법이 필요하다.

UIApplication.shared.keyWindow 대신, **현재 활성화된 UIScene의 windows 배열**을 이용하여 key window를 얻을 수 있다.
