# Error Handling

작업 실패 시 적절한 예외 처리를 통해 오류를 해결하고 원인을 찾을 수 있다.

<br>

## Throwing Function

매개 변수 선언과 반환 화살표 사이에 **throws** 키워드를 작성하는 방법이다.

```swift
func throwingFunction() throws -> Void

// 예시 코드
func fetchData(from url: String) throws -> Data {
    if url.isEmpty {
        throw NetworkError.urlInvalid
    }
}
```

반환 화살표 앞에 throws를 표시하는데, 이는 반환 전에 오류가 발생하면 오류 객체를 반환하기 위해서이다.

함수가 에러를 던질 수 있는지 명확하게 표시할 수 있다.

해당 함수를 호출할 때마다 try를 명시하여 에러 처리를 해줘야 한다.

<br>

## Do-Catch

do-catch 문을 활용하여 오류를 처리할 수 있다.

에러를 던지는 함수나 메서드 호출 시에는 **try** 키워드를 사용하고, 에러를 잡기 위해 **catch** 블록을 사용한다.

```swift
do {
    let data = try fetchData(from: "https://example.com")
} catch NetworkError.urlInvalid {
    print("URL이 잘못되었습니다.")
} catch {
    print("알 수 없는 에러: \(error)")
}
```

여러 catch 블록을 사용하여 코드 복잡성이 증가할 수 있어 주의가 필요하다.

<br>

## Optional try (try?)

**try?** 키워드를 사용하여 오류를 옵셔널 값으로 변환하여 처리한다.

실패할 경우 nil을 반환할 수 있다.

```swift
let data = try? fetchData(from: "https://example.com")
```

별도의 에러 처리 코드 없이 결과를 옵셔널로 바로 받을 수 있지만, 구체적인 에러 유형은 알 수 없다.

<br>

## Forced try (try!)

에러가 절대로 발생하지 않을 것이라는 확신이 있을 때, **try!** 키워드를 사용하여 에러 전파를 비활성할 수 있다.

예상치 못한 에러가 발생할 경우 런타임 오류가 발생한다.

```swift
let data = try! fetchData(from: "https://safe-url.com")
```
