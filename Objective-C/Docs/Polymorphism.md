# 다형성(Polymorphism)

여러 가지 형태를 갖는 것으로, 클래스가 상속으로 관련된 계층 구조를 갖는 경우 발생한다.<br>
멤버 함수를 호출했을 때, 함수를 호출한 객체의 유형에 따라 다른 함수가 실행되도록 하는 것을 의미한다.<br>
동일한 메시지를 보내더라도 리시버 객체에 따라 적절한 메서드가 선택되어 실행되는 성질을 의미한다.<br>

#### 절차적 프로그래밍 (C)
```c
switch(target->kind){
  case Line :
  lineDragged(drection);
 
  case Circle : 
  circleMove(drection);
  break;
}
```

#### 객체 지향 프로그래밍 (Objective-C)
```objective-c
[target move:direction];
// 각 개체가 처리될 때, 어떤 처리를 할지는 실제로 메시지를 받은 객체가 결정한다.
```

### 다형성 예시 코드

```objective-c

// Shape 라는 클래스는 도형 전체를 통틀어 일컫는 클래스이다.
// 도형이므로 area값이 존재하고, area를 계산하는 함수와 출력하는 함수 calculateArea, printArea 가 존재한다.

@interface Shape: NSObject {
	CGFloat area; 
}
- (void)printArea;
- (void)calculateArea;
@end

@implementation Shape
- (void)printArea {
	NSLog(@“The area is @f”, area);
}
- (void)calculateArea {
}
@end



// Shape 중에서 Square를 구현한 부분
// 정사각형이므로 length 하나의 값만 필요하다.
// length 값에 따라 area 값이 결정되며, calculateArea, printArea 함수가 구현되었다.

@interface Square: Shape {
	CGFloat length;
}
- (id)initWithSide: (CGFloat)side;
- (void)calculateArea;
@end

@implementation Square
- (id)initWithSide: (CGFloat)side {
	length = side;
	return self;
}
- (void)calculateArea {
	area = length * length;
}
- (void)printArea {
	NSLog(@“The area of square is %f”, area);
}
@end



// Shape 중에서 Rectangle을 구현한 부분
// 일반적인 사각형이므로 length, breadth 값 두 개가 필요하다.
// length 값과 breadth 값에 따라 area 값이 결정되며, calculateArea 함수가 구현되었다.

@interface Rectangle: Shape {
	CGFloat length;
	CGFloat breadth;
}
- (id)initWithLength: (CGFloat)rLength andBreadth:(CGFloat)rBreadth;
@end

@implementation Rectangle
- (id)initWithLength: (CGFloat)rLength andBreadth:(CGFloat)rBreadth {
	length = rLength;
	breadth = rBreadth;
	return self;
}
- (void)calculateArea {
	area = length * breadth;
}
@end
```
