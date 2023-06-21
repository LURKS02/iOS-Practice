# Block

코드를 캡슐화하고 익명 함수로 사용하기 위한 기능<br>
일반적으로 비동기 작업이나 콜백 기반의 코드에서 사용한다.<br>

```objective-c
^{
	// 작동 코드…
}
```
위에서 ^표시가 블록임을 선언한다.
```objective-c
반환형 (^블록명) (파라미터 타입);
// ex. void (^blockName) (void);
```
Completion Handler같은 경우, 블록을 함수의 argument로 전달하게 된다.<br>
```objective-c
- (void)exampleMethodName: (블록 선언이 들어갈 자리) 블록 이름;
// ex. (void)exampleMethodName: (void (^blockName)(void))methodBlockName;
// 블록 이름은 생략 가능하다.
// ex. (void)exampleMethodName: (void (^)(void))methodBlockName;
```
이때 methodBlockName은 함수 안에서 쓸 블록 이름으로, 호출도 가능하다.<br>
```objective-c
- (void)exampleMethodName: (void (^)(void))methodBlockname {
	…
	methodBlockName();
}
```

