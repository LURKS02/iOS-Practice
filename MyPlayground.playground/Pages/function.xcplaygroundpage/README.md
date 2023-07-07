# Function

- function : 작업의 가장 작은 단위이자 코드의 집합

```swift
func 함수명(파라미터 이름: 데이터 타입) -> 리턴 타입 {
  return 리턴값
}
```
1. 일반적인 함수
```swift
func myFunc(a: Int, b: Int) -> Int {
  return a + b
}
myFunc(a: 1, b: 1)
```
2. 매개변수가 없는 함수
```swift
func myFunc() -> Int {
  return 1
}
3. 반환값이 없는 함수
```swift
func myFunc(a: Int) -> Void {
  print()
}
```
4. 매개변수에 기본값이 들어간 함수
```swift
func myFunc(a: Int = 3) -> Int {
  return a
}
```
5. 전달인자 레이블을 사용한 함수
```swift
func myFunc(From a: Int, To b: Int) -> Int {
  return a + b
}
myFunc(From: 1, To: 2)
```
6. 전달인자 레이블을 사용하지 않는 함수
```swift
func myFunc(_ a: Int) -> Int {
  return a
}
myFunc(1)
```
7. 가변 매개변수를 활용한 함수
```swift
func myFunc(a: String, b: String...) -> String {
  return b
}
myFunc(a: "A", b: "B", "C", "D")  //["B", "C", "D"]
```
