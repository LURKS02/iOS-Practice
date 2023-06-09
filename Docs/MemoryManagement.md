# Memory Management

객체의 메모리가 필요할 때 할당되고, 더 이상 필요하지 않을 때 해제되는 과정<br>
불필요한 객체를 해제하지 않는 어플리케이션은 메모리 사용량이 증가하여 성능이 저하될 수 있다.<br>

#### objective-C의 메모리 관리 기법
1. Manual Retain-Release (MRR)
2. Automatic Reference Counting (ARC)

<br>

## Manual Retain-Release (MRR)
개발자가 직접 객체의 수명을 관리해야 하는 기법<br>
개발자는 객체에 대해 수동으로 참조를 추가하거나 해제하여 객체의 수명을 제어한다.<br>
MRR은 retain, release 및 autorelease와 같은 메모리 관련 메서드를 사용하여 수행되며, Foundation 클래스인 NSObject이 제공하는 런타임 환경과 함께 참조 카운팅(reference counting)이라는 모델을 사용하여 구현된다.<br>
MRR 과 ARC 의 유일한 차이점은 retain 및 release 의 수동/자동 처리 여부이다.<br>


#### MRR 의 기본적인 규칙
- alloc / new / copy / mutableCopy 로 시작하는 메서드를 사용하여 객체를 생성하여 소유한다.
- retain을 사용하여 객체를 소유할 수 있으며, 받은 객체는 일반적으로 받은 메서드 내에서 유효한 상태를 유지할 것으로 보장되고, 해당 메서드는 객체를 호출자에게 안전하게 반환할 수 있다.
- retain은 속성 값으로 저장하려는 객체를 소유하기 위해 엑세서 메서드나 init 메서드의 구현 / 다른 작업의 부작용으로 인해 객체가 무효화되는 것을 방지하기 위해 사용한다.
- 소유한 객체의 소유권을 해제하기 위해 release / autorelease 메시지를 보내며, 객체의 소유권을 포기하는 것을 일반적으로 해제(releasing)라고 한다.
- 소유하지 않은 객체의 소유권은 포기할 수 없다.

#### MRR 예시
```objective-c
#import <Foundation/Foundation.h>

@interface SampleClass:NSObject
- (void)sampleMethod;
@end

@implementation SampleClass
- (void)sampleMethod {
   NSLog(@"Hello, World! \n");
}

- (void)dealloc  {
  NSLog(@"Object deallocated");
  [super dealloc];
}

@end

int main() {
   
   /* my first program in Objective-C */
   SampleClass *sampleClass = [[SampleClass alloc]init];
   [sampleClass sampleMethod];
   
   NSLog(@"Retain Count after initial allocation: %d", 
   [sampleClass retainCount]);
   [sampleClass retain];
   
   NSLog(@"Retain Count after retain: %d", [sampleClass retainCount]);
   [sampleClass release];
   NSLog(@"Retain Count after release: %d", [sampleClass retainCount]);
   [sampleClass release];
   NSLog(@"SampleClass dealloc will be called before this");
   
   // Should set the object to nil
   sampleClass = nil;
   return 0;
}
```


<br>


## Automatic Reference Counting (ARC)
시스템은 MRR 과 동일한 참조 카운팅 시스템을 사용하지만, 컴파일 시점에 적절한 메모리 관리 메서드 호출을 자동으로 삽입한다.<br>
release 및 retain 메서드를 추가할 필요가 없고, 내부 프로세스는 동일하나 컴파일러가 이러한 작업을 대신 처리한다. <br>

#### ARC 예시
```objective-c
#import <Foundation/Foundation.h>

@interface SampleClass:NSObject
- (void)sampleMethod;
@end

@implementation SampleClass
- (void)sampleMethod {
   NSLog(@"Hello, World! \n");
}

- (void)dealloc  {
  NSLog(@"Object deallocated");
}

@end

int main() {
   /* my first program in Objective-C */
   @autoreleasepool {
      SampleClass *sampleClass = [[SampleClass alloc]init];
      [sampleClass sampleMethod];
      sampleClass = nil;
   }
   return 0;
}
```

