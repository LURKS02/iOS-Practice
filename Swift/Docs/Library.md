## CocoaPods

가장 오래된 swift 패키지 매니저 중 하나로, 필요한 오픈소스 라이브러리들을 검색하여 프로젝트에 사용할 수 있다.

[https://cocoapods.org/](https://cocoapods.org/에서) 에서 pod 검색이 가능하다.

중앙 집중식 Specs 저장소를 사용하여 pod 정의를 관리한다.

Podfile에 의존성을 선언하고, pod install 명령어로 fetch 후 dependencies들을 build한 후 프로젝트에 추가한다.

```swift
설치
$ sudo gem install cocoapods

시작
$ pod init

Podfile 내부에 pod 'ObjectMapper', '~> 3.4' 추가
명시한 라이브러리를 프로젝트에 설치

$ pod install
.xcworkspace 생성
```

podfile은 CocoaPods을 통하여 라이브러리들을 관리할 수 있는 파일로, 라이브러리와 버전, 업데이트 등에 대한 정보를 작성한다.

프로젝트에 별도의 구조를 추가하는 형식이다.

라이브러리들을 프로젝트의 컴파일 및 빌드 프로세스에 추가해야 하므로 빌드 시간이 증가한다. 

가장 오래된 패키지 관리 도구 중 하나로, 빌드 시간 증가와 install의 번거로움 때문에 제거되는 추세이다.

<br>

## Carthage (카르타고)

빌드 시 라이브러리를 프로젝트와 통합하지 않고 관리한다.

CocoaPods의 경우 라이브러리와 함께 빌드하지만, Carthage는 동적 라이브러리로 관리가 가능하여 빌드 속도가 비교적 빠르다.

중앙 집중식 저장소 개념이 없으며, 대신 Github 등의 저장소 URL을 사용하여 의존성을 가져온다.

새로운 워크스페이스를 생성하지 않고 framework로 의존성을 추가하여 필요한 순간에 가져와 사용한다.

빌드된 프레임워크를 수동으로 프로젝트에 연결해야 하므로, 초기 설정 방법이 CocoaPods에 비하여 복잡하다.

<br>

## SPM (Swift Package Manager)

Apple에서 공식적으로 지원하는 의존성 관리 도구이다.

Package.swift 파일을 사용하여 의존성을 정의하고, Xcode 내부에서 직접 의존성을 관리한다.

Git 저장소를 사용하여 패키지를 가져온다.

Xcode와 밀접하게 통합되어 있어 별도의 설정 없이 Xcode에서 패키지를 직접 관리할 수 있다.

의존성 관리가 간단하고 Xcode와 통합되어 있어 Swift 기반 프로젝트에서 점점 더 많이 사용되는 추세이다.
