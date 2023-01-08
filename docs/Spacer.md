# Spacer

View 간의 간격을 띄울 때 사용한다.<br>
두 View 간에 기본적으로 사용 가능한 전체 공간을 띄운다.

<img width="407" alt="스크린샷 2023-01-09 오전 8 27 01" src="https://user-images.githubusercontent.com/63408930/211224297-deca7986-ac35-4a11-87fa-123f5d2d0002.png">

```swift
HStack {
  Text("Red").background(.red)
  Text("Yellow").background(.yellow)
  Text("Blue").background(.blue)
}
```

<img width="409" alt="스크린샷 2023-01-09 오전 8 29 12" src="https://user-images.githubusercontent.com/63408930/211224356-fc9ddbac-81e2-4bb0-a55e-855fb7d3a84e.png">


```swift
HStack {
  Text("Red").background(.red)
            
  Spacer()
            
  Text("Yellow").background(.yellow)
  Text("Blue").background(.blue)
}
```

<img width="411" alt="스크린샷 2023-01-09 오전 8 31 43" src="https://user-images.githubusercontent.com/63408930/211224444-bd337e05-382f-425a-915e-d0c2721236d1.png">

```swift
HStack {
  Text("Red").background(.red)
            
  Spacer()
            
  Text("Yellow").background(.yellow)
            
  Spacer()
            
  Text("Blue").background(.blue)
}
```

Spacer를 n개 선언하면, 영역은 n등분된다.

<br>

## Spacer의 여백 크기 지정 방법

### 1.minLength 파라미터 사용

<img width="418" alt="스크린샷 2023-01-09 오전 8 35 07" src="https://user-images.githubusercontent.com/63408930/211224584-f32d7ea3-e967-40df-b126-42c9dd9c12b7.png">

```swift
Spacer(minLength: ?)
```

minLength 값만큼 Spacer의 여백을 최소 보장한다.

<br>

### 2. frame modifier 활용

<img width="409" alt="스크린샷 2023-01-09 오전 8 38 06" src="https://user-images.githubusercontent.com/63408930/211224670-78928665-80b5-4755-8ca8-74b242c4eb97.png">

```swift
Spacer().frame(width: ?)
```
Spacer에 frame modifier를 설정하여 여백의 크기를 지정할 수 있다.
