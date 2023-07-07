# 동기 & 비동기

### 동기 (synchronous)
직렬적으로 테스크를 수행하는 방식<br>
요청을 보낸 후 응답을 받아야 다음 동작이 이루어지는 방식<br>
테스크를 처리하는 동안 나머지 테스크는 대기 상태에 들어간다.<br>

### 비동기 (asynchrounous)
병렬적으로 테스크를 수행하는 방식<br>
요청을 보낸 후 응답의 수락 여부와는 관계 없이 다음 테스크가 동작하는 방식<br>
응답 후 처리할 <콜백 함수>를 통해 해당 테스크가 완료되었을 때 콜백 함수를 호출할 수 있다. <br>
Web API, Ajax, setTimeout 등이 있다.<br>

<br>

### 비동기 콜백의 문제점
#### Callback Hell
비동기 처리를 위해 콜백 패턴을 사용하면 처리 순서를 보장하기 위하여 여러 개의 콜백 함수가 중첩되어 복잡도가 높아지는 콜백 헬이 발생한다.<br>
```swift
step1(function(value1) {
	step2(value1, function(value2) {
		step3(value2, function(value3) {
			step4(value3, function(value4) {
				step5(value4, function(value5) {
				
				});
			});
		});
	});
});
```

<br>

### 기존의 비동기 처리 방식
주로 DispatchQueue에 직접 접근하거나, completionHandler를 전달받아 작업이 완료되었을 때 호출하는 방식을 통해 비동기 작업을 할 수 있었다.<br>
#### DispatchQueue
```swift
DispatchQueue.global.async {
}
```
스레드가 실행할 직업이 들어있는 Queue<br>
- main queue : UI에 직접 드러나는 작업들을 쌓아두는 큐, 어플리케이션 화면을 구현하는 곳에서 일어나는 모든 작업이 main에서 실행된다.<br>
- global queue : UI에 직접 보이는 작업이 아닌, 백그라운드에서 실행되는 로직들이 쌓인다.<br>
<br>
특정 작업을 비동기적으로 처리하기 위해 global 큐에 .async를 붙여 작업을 넘겨주면, 이때 넘겨주는 작업은 해당 큐의 다른 작업중에 sync로 실행되는 작업이 없으면 바로 실행된다.<br>
Async로 작업을 실행한 뒤, 큐는 다시 새로운 작업이 들어오기를 기다린다.<br>

```swift
let task = URLSession.shared.dataTask(with: url, completionHandler: {
	data, response, error in
	//do something
})
task.resume()
```
만약 url주소를 통해 이미지를 받아오는 작업을 할 때, 스레드가 사진을 가져오는 작업이 끝날 때까지 다른 일을 하지 못한다면 View는 계속 멈춰있게 된다. <br>
따라서 데이터를 받아올 때 까지 다른 작업을 수행할 수 있도록, 데이터를 다 받아오면 completionHandler를 실행하도록 한다.<br>
즉 백그라운드에서 데이터를 받아오는 작업이 진행되고, 메인 스레드는 다른 작업을 하다가 데이터를 모두 받아오면 스레드에 completionHandler를 올려 받아온 데이터를 기반으로 작업을 할 수 있도록 한다.<br>

<br>

### 기존 비동기 처리 방식의 단점
```swift
func processImageData(completionBlock: (_result: Image) -> Void) {
	loadWebResource(“dataprofile.txt”) { dataResource in
		loadWebResource(“imagedata.dat”) { imageResource in
			decodeImage(dataResource, imageResource) { imageTmp in
				dewarpAndCleanupImage(imageTmp) { imageResult in
					completionBlock(imageResult)
				}
			}
		}
	}
}

processImageData { image in
	display(image)
}
```
비동기 작업을 연속적으로 실행해야 하는 경우, 클로저 안에 연쇄적으로 클로저가 등장하는 형태가 되어 가독성이 매우 낮아진다.<br>
```swift
func processImageData(completionBlock: (_result: Image?, _ error: Error?) -> Void) {
	loadWebResource(“dataprofiqle.txt”) { dataResource, error in
		guard let dataResource = dataResource else {
			completionBlock(nil, error)
			return
		}
		loadWebResource(“imagedata.txt”) { imageResource, error in
			guard let imageResource = imageResource else {
				completionBlock(nil, error)
				return
			}
			decodeImage(dataResource, imageResource) { imageTmp, error in
				guard let imageTmp = imageTmp else {
					completionBlock(nil, error)
					return
				}
				dewarpAndCleanupImage(imageTmp) { imageResult, error in
					guard let imageResult = imageResult else {
						completionBlock(nil, error)
						return
					}
					completionBlock(imageResult)
				}
			}
		}
	}
}
```
에러 핸들링까지 추가될 경우, 코드의 가독성이 매우 떨어진다.<br>

```swift
func processImageData(recipient: Person, completionBlock: (_ result: Image) -> Void) {
	let swizzle: (_ contents: Image) -> Void = {
	}
	if recipient.hasProfilePicture {
		swizzle(recipient.profilePicture)
	} else {
		decodeImage { image in
			swizzle(image)
		}
	}
}
```
조건문에 따른 처리도 간단하지 않다.<br>

<br>

### Async & Await
```swift
func loadWebResource(_ path: String) async throws -> Resource
func decodeImage(_ r1: Resource, _ r2: Resource)async throws -> Image
func dewarpAndCleanupImage( _ i : Image) async throws -> Image

func processImageData() async throws -> Image {
	let dataResource = try await loadWebResource(“dataprofile.txt”)
	let imageResource = try await loadWebResource(“imagedata.dat”)
	let imageTmp = try await decodeImage(dataResource, imageResource)
	let imageResult = try await dewarpAndCleanupImage(imageTmp)
	return imageResult
}
```
completionHandler로 복잡하게 처리하던 코드를 깔끔하게 정리할 수 있다.<br>

#### async 함수
async는 해당 함수가 비동기적으로 작업을 처리하는 함수임을 명시한다.<br>
async를 통해 비동기적 수행을 하는 함수로 명시해주기는 했지만 내부에 있는 모든 명령이 비동기적으로 수행되는 것은 아니므로, 특정 명령에 대해서만 await를 사용하여 비동기적 작업이 일어나는 곳을 명시해줘야 한다.<br>
따라서 await는 함수가 실행되는 도중 스레드를 포기하는 시점인 suspension point가 발생할 수 있는 명령에 붙여준다.<br>
함수는 suspension point에서 스레드를 포기하고, 백그라운드에서 진행되는 작업이 완료되면 다시 suspension point 부터 함수를 재시동한다.<br>

<br>

### 주의점 : sync 함수 내에서 async 함수를 사용하는 경우
Sync 함수 내에서 비동기적으로 움직일 수 있는 작업을 전달하는 것은 문제를 일으킬 수 있다.<br>
- 해당 비동기 작업이 끝날 때 까지 함수가 스레드를 잡고 계속해서 기다리는 경우가 생긴다.<br>
- async 함수는 실행될 떄 suspension point를 설정해두고, 의도한 작업이 완료되면 해당 시점부터 실행하게 된다. 하지만 sync 함수는 내부에 있는 async 명령이 백그라운드 작업을 시작하게만 해놓고, 명령을 실행하긴 했으니 작업의 완료를 기다리지 않고 함수를 끝내버릴 수 있다. 이에 따라 async가 의도했던 작업이 제대로 이루어지지 않고, sync함수 또한 제대로 된 값을 받지 못해 기능을 못하게 된다.<br>
따라서 Swift 컴파일러는 sync 함수 내에 async 함수가 들어올 경우 에러가 발생한다.<br>
반면 async 함수 안에 동기적으로 실행되는 함수를 넣는 것은 가능한데, 비동기적 작업은 await로 표시되고, 다른 일반적인 작업들은 동기적으로 실행하는 것이 가능하다.<br>

