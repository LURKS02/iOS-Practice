# Error Handling

- swift의 에러 처리
```swift
enum PrinterError: Error {
  case outOfPaper
  case noToner
  case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
  if printerName == "Never Has Toner" {
    throw PrinterError.noToner
  }
  return "Job Sent"
}
```
throws 키워드를 사용하여 해당 함수가 오류를 발생시킬 수 있음을 표시한다.<br>
throw 키워드를 사용하여 오류를 발생시킨다.<br>
함수에서 에러가 발생하면 함수가 즉시 반환되고 함수를 호출한 코드가 에러를 처리한다.

- do-catch 구문을 이용한 에러 처리
> do 블록 내에서 오류를 발생할 수 있는 코드 앞에 try를 추가한다.<br>
> catch 문에서 다른 지정이 없으면 Error 프로토콜을 상속받은 타입에 있는 이름이 출력된다.
```swift
do {
  let printerResponse = try send(job: 1040, toPrinter: "ABC")
  print(printerResponse)
} catch {
  print(error)
}
```
