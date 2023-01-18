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

