# Outlet

@IBOutlet 키워드를 사용하며, 객체의 캡슐화된 데이터의 일부가 되고 인스턴스 변수로 지원된다.<br>
코드와 인터페이스 빌더(storyboard 또는 XIB 파일) 사이의 연결을 의미하며, 프로그래밍 코드에서 사용자 인터페이스의 요소를 참조할 수 있게 한다.<br>

```objective-c
@interface AppController: NSObject {

}
@property (weak) IBOutlet NSArray *keywords;
```
IBOutlet의 목적은 인터페이스 빌더에게 XIB(NIB) 파일 안의 객체와 연결되어 있는 인스턴스 변수라고 알려주는 힌트를 제공하는 것이다.<br>
NIB파일이 로드될 때마다 각 연결이 추출되고 재설정되므로, 다른 객체에게 메시지를 보내야 할때마다 항상 사용이 가능하다.<br>
IBOutlet은 property 선언에 적용되어 인터페이스 빌더가 해당 property를 outlet으로 인식하고 Xcode와의 연결 및 표시를 동기화할 수 있도록 한다.
Weak reference로 선언되어 strong reference cycle을 예방할 수 있다.<br>
일반적으로 사용자 인터페이스 객체와 controller 객체 사이에 outlet 연결을 설정하지만, 인터페이스 빌더에서 인스턴스로 표시할 수 있는 모든 객체 사이에 설정이 가능하다.<br>
객체가 outlet을 가질수록 메모리를 더 많이 차지한다.<br>
객체 합성의 한 형태로, 객체가 메시지를 보낼 수 있도록 그 구성 요소 객체에 대한 참조를 얻는데 필요한 동적 패턴이다.<br>
