# 접근자 (Accessor)

객체의 특정 속성에 접근하는 메서드<br>
일반적으로 속성 값을 가져오거나(getter) 설정할(setter) 수 있다.<br>


### 접근자의 장점
- 캡슐화(Encapsulation)
외부에서 직접 인스턴스 변수에 접근하지 않고 접근자 메서드를 통해 접근하므로, 내부 구현 세부 사항을 숨길 수 있다.
- 유연성 및 유지보수성
내부 구현을 수정하지 않고도 프로퍼티의 동작을 변경할 수 있으며, 프로퍼티 접근 방식을 유지하면서 내부 구현의 변경이 가능하다.<br>
만일 접근자를 사용하지 않을 경우, 클래스 구현 방법이 바뀌어 인스턴스 변수가 없어지거나 역할이 바뀌게 되면 인스턴스를 사용하는 다른 모듈 동작에 영향이 간다.<br>
- 메모리 관리와 스레드 안전성
@property 선언에 따라 메모리 관리 속성을 지정하여 메모리 누수 및 잘못된 메모리 해제를 방지할 수 있다.<br>
- 코드 가독성과 표현력
프로퍼티를 사용하여 객체의 속성을 직관적으로 읽고, 메서드 호출과 유사한 형식으로 값을 설정할 수 있다.


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
