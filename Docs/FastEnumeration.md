# Fast Enumeration

#### Collection
객체들을 보관하고 관리하는 데 사용되는 기본적인 구조체<br>
객체를 효율적으로 저장하고 검색할 수 있는 공통적인 방법을 제공한다.<br>
모든 컬렉션은 다른 객체를 보관할 수 있는 목적은 공유하지만, 주로 객체 검색 방식에서 차이가 있다.<br>
- NSSet
- NSArray
- NSDictionary
- NSMutableSet
- NSMutableArray
- NSMutableDictionary

<br>

#### Fast Enumeration 구문
```objective-c
for (클래스타입 변수명 in 컬랙션객체) {
	구문
}
```

<br>

#### Fast Enumeration 구문 예시
```objective-c
#import <Foundation/Foundation.h>

int main() {
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   NSArray *array = [[NSArray alloc]
   initWithObjects:@"string1", @"string2",@"string3",nil];
   
   for(NSString *aString in array) {
      NSLog(@"Value: %@",aString);
   }
   
   [pool drain];
   return 0;
}
```

<br>

#### Reverse Fast Enumeration 구문
```objective-c
for (클래스타입 변수명 in [컬렉션객체 reverseObjectEnumerator]) {
	구문
}
```

<br>

#### Reverse Fast Enumeration 구문 예시
```objective-c
#import <Foundation/Foundation.h>

int main() {
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   NSArray *array = [[NSArray alloc]
   initWithObjects:@"string1", @"string2",@"string3",nil];
   
   for(NSString *aString in [array reverseObjectEnumerator]) {
      NSLog(@"Value: %@",aString);
   }
   
   [pool drain];
   return 0;
}
```
