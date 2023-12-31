# App Thinning
 애플리케이션이 디바이스에 설치될 때, 앱 스토어와 운영체제가 디바이스의 특성에 맞게 설치되도록 하는 설치 최적화 기술<br>
최적화 과정을 통해 최소한의 디스크 사용과 빠른 다운로드를 제공할 수 있다.<br>
slicing, bitcode, on-demand resource 등등이 있다.<br>

### Slicing
어플리케이션이 다양한 기기 및 운영체제 버전에 대하여 여러가지 app bundle의 변형(app variant)을 생성하고, 해당 디바이스에 가장 적합한 조각을 전달하는 기술<br>
개발자가 App Store connect에 업로드하면, 앱스토어에서 디바이스 특성에 따라 다양한 버전의 조각들을 생성하고, 사용자가 그 조각 중에서 가장 알맞은 조각(App Variant)을 다운로드받게 된다.<br>

<br>

### Bitcode
컴파일된 프로그램의 중간표현(Intermediate Representation)<br>
이와 같은 중간 언어는 일련의 지침이 주어지면 다양한 방식으로 다시 컴파일하는데 사용할 수 있는 앱의 추상 인코딩이다.<br>
다른 아키텍처에 대한 최적화는 제거하여 다운로드는 더 작게 만들고, 관련 최적화만 다운로드하여 App Thinning 기술과 함께 사용된다.<br>
비트코드를 포함하면 어플리케이션의 새 버전을 앱스토어에 제출할 필요 없이 향후 앱 바이너리를 다시 최적화할 수 있다.<br>
iOS에서는 옵션이나 기본 설정으로 되어 있으며, 개발자가 프로젝트 옵션에서 선택할 수 있다.<br>
비트코드를 사용하여 업로드하면 애플에서 어플리케이션을 재컴파일하여 앱 바이너리(app binary)를 생성한다.<br>
비트코드를 사용하지 않으면, 모든 디바이스 경우에 따라 바이너리로 생성하여 합쳐져서 fat binary라는 것이 업로드 되지만, 비트코드를 사용하면 필요 경우에 따라 재컴파일하게 되므로 최적화가 가능하다.<br>

<br>

### 주문형 리소스 (on-demand resource)
사용자의 선택에 따라 필요할 때 다운로드 받는 것<br>
이미지나 사운드 같은 리소스를 키워드로 태그할 수 있고, 태그별로 그룹을 요청할 수 있다.<br>
앱스토어는 애플 서버의 리소스를 호스팅하고, 다운로드를 관리하며, 주문형 리소스를 분할시켜 어플리케이션의 변형을 더욱 최적화한다.<br>

#### 장점
사용자가 다운로드한 앱 번들의 크기가 작아지면 다운로드 속도가 빨라지며, 기기에 더 많은 저장 공간이 생긴다.<br>
앱에는 특정 상태에서만 사용되는 리소스가 있는데, 이 리소스를 지연 로딩 할 수 있다.<br>
리소스는 필요할 때 요청되므로, 앱에서 자주 사용되지 않는 리소스를 원격 저장할 수 있다.<br>
앱은 추가 리소스가 포함된 인앱 구매를 제공하며, 구매한 모듈에 대한 리소스는 앱이 시작된 후 앱에서 요청하게 된다. 따라서 이러한 인앱 구매 리소스를 원격 저장하는 것이 가능하다.<br>
