# Composite Objects

#### Class Clusters
Foundation 프레임워크에서 광범위하게 사용되는 디자인 패턴으로, 추상 팩토리 디자인 패턴에 기반을 두고 있다.<br>
여러 개의 privagte 서브 클래스를 하나의 public 추상 슈퍼클래스 아래에 그룹화한다.<br>
이러한 클래스 그룹화는 객체 지향 프레임워크의 공개적인 아키텍처를 단순화시키면서도 기능적인 풍부함을 유지할 수 있다.<br>
유사한 기능을 가지는 여러 개의 클래스를 생성하는 대신, 입력값에 따라 처리를 담당하는 단일 클래스를 생성하는 방법이다.<br>
Ex) NSNumber 에서는 char, int, bool 등 여러 클래스 클러스터가 존재하는데, 이러한 클래스들을 유사한 작업을 처리하는 단일 클래스로 그룹화한다.<br>

#### Composite Objects
설계된 객체 내에 private cluster 객체를 내장함으로써 생성<br>
특정 방식으로 처리하고자 하는 메시지만 가로채 처리하는 기본적인 기능을 위하여 cluster object에 의존할 수 있다.<br>
작성해야 하는 코드의 양을 줄이고, Foundation 프레임워크에서 제공하는 테스트된 코드를 활용할 수 있게 한다.<br>
composite object는 cluster의 추상 슈퍼클래스의 서브클래스로 자신을 선언해야 하며, 슈퍼클래스의 원시 메서드를 override 해야 한다.

#### Composite Objects 예시
```objective-c
#import <Foundation/Foundation.h>

@interface ValidatingArray : NSMutableArray {
   NSMutableArray *embeddedArray;
}

+ validatingArray;
- init;
- (unsigned)count;
- objectAtIndex:(unsigned)index;
- (void)addObject:object;
- (void)replaceObjectAtIndex:(unsigned)index withObject:object;
- (void)removeLastObject;
- (void)insertObject:object atIndex:(unsigned)index;
- (void)removeObjectAtIndex:(unsigned)index;

@end

@implementation ValidatingArray
- init {
   self = [super init];
   if (self) {
      embeddedArray = [[NSMutableArray allocWithZone:[self zone]] init];
   }
   return self;
}

+ validatingArray {
   return [[self alloc] init] ;
}

- (unsigned)count {
   return [embeddedArray count];
}

- objectAtIndex:(unsigned)index {
   return [embeddedArray objectAtIndex:index];
}

- (void)addObject:(id)object {
   if (object != nil) {
      [embeddedArray addObject:object];
   }
}

- (void)replaceObjectAtIndex:(unsigned)index withObject:(id)object; {
   if (index <[embeddedArray count] && object != nil) {
      [embeddedArray replaceObjectAtIndex:index withObject:object];
   }
}

- (void)removeLastObject; {
   if ([embeddedArray count] > 0) {
      [embeddedArray removeLastObject];
   }
}

- (void)insertObject:(id)object atIndex:(unsigned)index; {
   if (object != nil) {
      [embeddedArray insertObject:object atIndex:index];
   }
}

- (void)removeObjectAtIndex:(unsigned)index; {
   if (index <[embeddedArray count]) {
      [embeddedArray removeObjectAtIndex:index];
   }
}

@end

int main() {
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   ValidatingArray *validatingArray = [ValidatingArray validatingArray];
   
   [validatingArray addObject:@"Object1"];
   [validatingArray addObject:@"Object2"];
   [validatingArray addObject:[NSNull null]];
   [validatingArray removeObjectAtIndex:2];
   NSString *aString = [validatingArray objectAtIndex:1];
   NSLog(@"The value at Index 1 is %@",aString);
   [pool drain];
   
   return 0;
}
```

Composite 패턴은 “객체들의 집합을 단일 객체처럼 취급하는 패턴”으로, 객체들이 트리 구조로 구성되어 있을 때 유용하게 쓰인다.<br> 위 코드에서 핵심적인 부분은 ValidatingArray가 내부에 NSMutableArray를 포함하고 있는 부분으로, 이것이 합성(또는 구성)을 의미한다.<br>
ValidatingArray는 NSMutableArray의 기능을 확장하려는 의도로 설계되었으며, NSMutableArray의 모든 메소드를 재정의하여 특정 조건(예: nil 객체를 추가하려는 시도, 배열의 범위를 벗어나는 인덱스를 사용하는 시도 등)에 대하여 NSMutableArray에서 제공하지 않는 추가적인 유효성 검사를 수행한다.<br>
이때 ValidatingArray는 NSMutableArray를 내장하며 이를 통해 기능을 수행한다.<br>

<br>

#### ValidatingArray 클래스가 NSMutableArray를 상속하지 않고 합성을 사용하는 이유
1. Encapsulation: NSMutableArray의 모든 메소드를 공개하지 않고, ValidatingArray가 필요로 하는 메소드만 공개하여 객체의 내부 구현을 숨길 수 있다.
2. Interface Segregation: 이것은 "클라이언트는 자신이 사용하지 않는 인터페이스에 의존하게 만들어서는 안 된다"는 원칙으로, ValidatingArray가 NSMutableArray를 상속하게 되면 사용하지 않는 메소드들을 모두 상속받게 되지만, ValidatingArray가 NSMutableArray를 합성함으로써 필요한 메소드만을 재정의하고 나머지는 숨길 수 있다. 

<br>

#### Composite 패턴을 사용하지 않고 상속을 이용한 ValidatingArray의 구현 예시
```objective-c
#import <Foundation/Foundation.h>

@interface ValidatingArray : NSMutableArray
- (void)addObject:(id)anObject;
@end

@implementation ValidatingArray

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)addObject:(id)anObject {
    if (anObject == nil) {
        NSLog(@"Invalid object: nil");
        return;
    }
    [super addObject:anObject];
}

@end

int main() {
   @autoreleasepool {
       ValidatingArray *validatingArray = [[ValidatingArray alloc] init];
       [validatingArray addObject:@"Object1"];
       [validatingArray addObject:nil];
   }
   return 0;
}
```






