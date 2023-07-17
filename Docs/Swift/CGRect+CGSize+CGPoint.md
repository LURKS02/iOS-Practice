# CGRect & CGSize & CGPoint

### CGPoint
2차원 좌표계의 점을 포함하는 구조체<br>
x좌표, y좌표를 가지는 구조체이다.<br>

<br>

### CGSize
너비와 높이 값을 포함하는 구조체<br>
너비와 높이(width & height)의 값으로, 실제로 사각형으로 간주되는 것은 아니다.<br>

<br>

### CGRect
사각형의 위치와 크기를 포함하는 구조체<br>
사각형으로써, 너비와 높이를 가질 뿐만 아니라 원점(origin)을 가진다.<br>
즉, CGPoint와 CGSize를 가지고 있어 이를 통해 초기화시키거나, x / y / width / height를 통해 초기화시킬 수 있다.<br>

