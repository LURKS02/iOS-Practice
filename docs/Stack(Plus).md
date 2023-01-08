# Stack 기법

## 1. Stack의 크기 변경

<img width="449" alt="스크린샷 2023-01-09 오전 8 03 07" src="https://user-images.githubusercontent.com/63408930/211223497-38f16838-b2b2-4331-a22e-7cf4ec18c8e3.png">

```swift
HStack {
  ...
}
```

Stack의 크기는 내부 뷰를 표시하기 위한 최소한의 크기로 표시된다.

<img width="444" alt="스크린샷 2023-01-09 오전 8 04 24" src="https://user-images.githubusercontent.com/63408930/211223538-f25e4209-d427-469a-8321-7c50eeccc2b0.png">

```swift
HStack {
  ...
}.frame(width: ?, height: ?)
```

Stack의 Frame을 직접 지정해주고 싶을 경우, .frame modifier를 사용하여 설정한다.

<br>

## 2. Stack 내 정력 방식(alignment) 변경

Stack의 기본 정렬 방식은 .center이다.<br>
Stack의 정렬 방식을 변경하려면 Stack 생성 시 파라미터 값으로 alignment를 설정한다.<br>
(trailing / leading / center etc)

<img width="408" alt="스크린샷 2023-01-09 오전 8 10 58" src="https://user-images.githubusercontent.com/63408930/211223758-a106fd87-b85e-42b6-bf43-e22906d4200c.png">

```swift
VStack {
  ...
}
```

위 VStack을 trailing 정렬했을 때의 결과는 다음과 같다.

<img width="412" alt="스크린샷 2023-01-09 오전 8 12 35" src="https://user-images.githubusercontent.com/63408930/211223830-de9c2a64-d2cf-46b2-a953-4248dc922011.png">

```swift
VStack(alignment: .trailing) {
  ...
}
```

<br>

## 3. Stack 내의 여백(Spacing) 크기 변경

Stack 내부 뷰 간의 간격(여백)을 지정하는 spacing 파라미터의 기본 값은 nil이다.<br>
여백을 설정하려면 Stack 생성 시 파라미터 값으로 spacing을 설정해주면 된다.

<img width="420" alt="스크린샷 2023-01-09 오전 8 16 52" src="https://user-images.githubusercontent.com/63408930/211223970-81829e36-5c24-4e93-b4aa-05f4e5de0c74.png">

```swift
HStack {
  ...
}
```

위 HStack의 spacing을 0으로 설정한 결과는 다음과 같다.

<img width="415" alt="스크린샷 2023-01-09 오전 8 18 51" src="https://user-images.githubusercontent.com/63408930/211224031-76fb8f27-9887-4de6-be12-0e02dcc18a7a.png">

```swift
HStack(spacing: ?) {
  ...
}
```
