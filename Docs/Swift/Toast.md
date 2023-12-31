# Toast

사용자에게 간단한 메시지나 알림을 표시하기 위하여 사용되는 작은 팝업 형태의 UI 요소

안드로이드에서는 라이브러리로 제공하는 기능이지만, iOS에서는 지원하지 않아 직접 구현해야 한다.

```swift
class Toast {
    private static var toastWindow: UIWindow?
    
    static func show(text: String) {
        
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        
        toastWindow = UIWindow(windowScene: scene)
        toastWindow?.windowLevel = .alert + 1
        toastWindow?.rootViewController = UIViewController()
        //toastWindow?.rootViewController?.view.backgroundColor = .blue
        toastWindow?.isUserInteractionEnabled = false
        
        let messageLabel = UILabel()
        messageLabel.text = text
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 12)
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.backgroundColor = UIColor(white: 0, alpha: 0.5)
        messageLabel.layer.cornerRadius = 10
        messageLabel.clipsToBounds = true
        toastWindow?.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(100)
            
            let estimatedWidth = messageLabel.intrinsicContentSize.width + 20
            let estimatedHeight = messageLabel.intrinsicContentSize.height + 20
            make.width.equalTo(estimatedWidth)
            make.height.equalTo(estimatedHeight)
        }
        
        toastWindow?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1, animations: {
                messageLabel.alpha = 0
            }) {_ in
                messageLabel.removeFromSuperview()
                toastWindow = nil
            }
        }
    }
}
```

iOS 13 이후로 어플리케이션의 life cycle이 UIScene을 기반으로 변화하면서 UIWindow를 생성하여 직접 표시하려면 기존과 다른 방법이 필요하다.

UIApplication.shared.keyWindow 대신, **현재 활성화된 UIScene의 windows 배열**을 이용하여 key window를 얻을 수 있다.
