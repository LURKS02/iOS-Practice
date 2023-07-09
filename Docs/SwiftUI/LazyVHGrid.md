# Lazy V/H Grid

```swiftui
struct LazyVGrid<Content> where content: View
```
필요에 따라 항목을 생성하는, vertical / horizontal 로 성장하는 그리드로 자식 뷰를 배열하는 컨테이너 뷰<br>
<br>
lazy grid를 통하여 다차원 레이아웃으로 정렬된 스크롤 가능한 컬렉션을 표시할 수 있다.<br>
grid의 initializer에 GridItem을 통하여 행/열의 수를 지정해줄 수 있다.<br>

```swiftui
struct VerticalSmileys: View {
	let columns = [GridItem(.flexible()), GridItem(.flexible())]

	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach(0x1f600...0x1f679, id: \.self) { value in
					Text(String(format: "%x", value))
					Text(emoji(value))
						.font(.largeTitle)
				}
			}
		}
	}

	private func emoji(_ value: Int) -> String {
		guard let scalar = UnicodeScalar(value) else { return "?" }			
		return String(Character(scalar))
	}
}
```
