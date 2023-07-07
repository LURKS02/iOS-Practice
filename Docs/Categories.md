# Categories

기존 클래스에 메서드를 추가하여 확장하고 싶을 때 사용한다.<br>
특정 클래스에 종속적이기 때문에 처음 선언할 때 부터 확장하려고 하는 클래스의 이름을 적어준다.<br>
카테고리에 추가된 메서드는 해당 클래스 및 서브 클래스의 모든 인스턴스에서 사용 가능하지만, 추가 메서드를 사용하려는 소스에서는 카테고리 헤더 파일을 import 해야 한다.<br>

#### 카테고리의 특징
- Implementation 코드의 여부와 관계 없이 모든 클래스에 대하여 선언이 가능하다.
- 카테고리에서 선언한 모든 메서드는 원본 클래스의 모든 인스턴스뿐만 아니라 원본 클래스의 서브 클래스에서도 사용할 수 있다.
- Runtime 시, 원본 클래스에 의하여 구현된 메서드와 카테고리에 의해 추가된 메서드 간 차이는 없다.

#### 카테고리 사용
```objective-c
@interface ClassName (CategoryName)

@end
```

#### 예시
```objective-c
@interface NSString(MyAdditions)
+(NSString *)getCopyRightString;
@end

@implementation NSString(MyAdditinos)
+(NSString *)getCopyRightString {
	return @“Copyright”;
}
@end

Int main(int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSString *copyrightString = [NSString getCopyRightString];
	NSLog(@“Accessing Category: %@“, copyrightString);

	[pool drain];
	return 0;
}
```
