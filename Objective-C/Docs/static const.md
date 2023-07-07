# Static Const

### const
클래스 내부에서만 사용할 전역상수로 사용할 수 있지만, 내부에서 사용할 전역상수 목적일 경우 반드시 static const를 이용한다.<br>
변수가 static으로 선언되지 않으면 컴파일러는 해당 변수를 외부 심벌(external symbol)을 생성하게 되고, 다른 파일에서 동일한 이름의 변수를 선언하면 링커에서 에러를 일으킨다.<br>

<br>

### static const
헤더 파일에 선언 시 해당 헤더를 import한 곳에서 공용으로 사용이 가능하지만, 구현부에 정의하여 클래스 내부에서 사용할 전역상수로 사용하는 것이 좋다.<br>
해당 헤더를 import한 파일에서 static const 로 선언한 상수와 동일한 변수명을 정의했을 경우 import된 static const 값은 무시하고 재정의한 변수명으로 사용된다.<br>

```objective-c
// .m파일
static const int kNumber = 10;

@implementation 
…
@end
```
위 코드에서 kNumber는 해당 .m파일 내에서만 접근이 가능하다.


<br>

### extern const
클래스 외부에서 공용으로 사용할 전역상수로 사용한다.<br>
헤더가 아닌 구현부에서만 초기화 가능하다.<br>
```objective-c
// .h파일
extern const int kNumber;

//.m파일
const int kNumber = 10;
```
이제 이 상수는 헤더 파일을 import하는 모든 파일에서 사용이 가능하다.
```objective-c
NSLog(@“%d”, kNumber);
```
