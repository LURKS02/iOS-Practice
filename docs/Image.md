# Image

### 이미지 불러오기
```swift
Image("imageName")
```

### 이미지 뷰 크기 조절 (이미지 유지)
```swift
Image("imageName").frame(width: ?, height: ?)
```

### 이미지 크기 조절 (리사이징)
```swift
Image("imageName")
  .resizable()
  .frame(width: ?, height: ?)
```
현재 View에 맞게 이미지를 채워준다. (이미지가 찌그러질 수 있음)

### 비율 유지, 화면에 맞게 배치
```swift
Image("imageName")
  .resizable()
  .scaledToFit()
```

### 비율 유지, 화면보다 꽉 차게 배치
```swift
Image("imageName")
  .resizable()
  .scaledToFill()
```

### 프레임이 넘어가는 부분 자르기
```swift
Image("imageName")
  .resizable()
  .scaledToFill()
  .frame(width: ?, height: ?)
  .clipped()
```

### 사진 원하는 모양으로 자르기
```swift
Image("imageName")
  .resizable()
  .scaledToFill()
  .frame(width: ?, height: ?)
  .clipShape(Circle())
```
