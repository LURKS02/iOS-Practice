# 메서드 (Method)

### Instance Method
- -로 시작
- 메시지 리시버가 객체
- 클래스 멤버 변수에 접근 가능하다.
- 메시지 리시버가 객체이므로 객체 선언 및 초기화가 필요하다.

```objective-c
// 선언 예시
-(void)my_method;


// 사용 예시
Test *ins = [[Test alloc] init];
[ins my_method];
```


<br>

### Class Method
- +로 시작
- 메시지 리시버가 클래스
- 클래스 멤버 변수에 접근이 불가능하다.
- 메시지 리시버가 클래스이므로 객체 선언과 초기화 없이 클래스명으로 호출이 가능하다.

```objective-c
// 선언 예시
+(void)my_method;

//사용 예시
[Test my_method];
```
