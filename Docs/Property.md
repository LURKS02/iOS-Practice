# 접근자(Property)


Objective-C에서는 인스턴스 객체 속성에 접근할 때 변수에 접근하는 메서드를 정의하여 사용한다.<br>

#### 읽기 접근자 (Getter)
객체의 인스턴스 변수 값을 반환하는 메서드<br>
@property 키워드를 사용하여 선언하면 자동으로 생성된다.<br>

#### 쓰기 접근자 (Setter)
객체의 인스턴스 변수 값을 설정하는 메서드<br>
@property 키워드를 사용하여 선언하면 자동으로 생성된다.<br>


```objective-c
@property (nonatomic, strong) NSString *name;
// name에 대한 getter / setter를 자동으로 생성
```

#### 사용자 정의 접근자 (Custom Accessor)
개발자가 직접 접근자 메서드를 구현하는 방법<br>
@property 키워드에 getter / setter 를 명시하여 원하는 메서드 이름을 지정할 수 있다.<br>
프로퍼티 값의 가공, 유효성 검사, 부가 동작을 처리할 수 있다.<br>

```objective-c
@property (nonatomic, getter = isHidden) BOOL hidden;
// getter는 isHidden, setter는 setHidden 으로 사용됨.
```
