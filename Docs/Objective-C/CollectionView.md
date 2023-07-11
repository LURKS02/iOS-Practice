# Collection View

화면에 콘텐츠를 표시하기 위해 다양한 object들과 협력하는 데이터 중심 객체<br>
(Ex. 보여주는 아이템의 개수를 collection view에게 알려주는 data source object를 제공해야 한다.)<br>
Collection view의 디자인은 보여지는 데이터와, 데이터가 배열되고 표시되는 방법을 분리한다.<br>
어플리케이션이 보여지는 데이터에 대한 강력한 책임이 있더라도, 그것에 대한 시각적인 책임은 수많은 다른 object들에 의해 관리된다.<br>

## Collection View 구현을 위한 클래스와 프로토콜
### Top-level containment and management
#### UICollectionView
컬렉션 뷰의 콘텐츠를 위한 가시 영역을 정의<br>
UIScrollView에서 상속되며, 필요에 따라 큰 스크롤 가능한 영역을 포함할 수 있다.<br>
레이아웃 object로부터 받아온 정보를 기반으로 데이터의 표시를 용이하게 할 수 있다.<br>

#### UICollectionViewController
컬렉션 뷰를 위한 view controller 수준의 관리 지원을 제공하는 선택적 객체<br>

<br>

### Content management
#### UICollectionViewDataSource
컬렉션 뷰와 관련된 가장 중요한 객체로, 반드시 제공해야 하는 객체 중 하나이다.<br>
컬렉션 뷰의 콘텐츠를 관리하고 해당 콘텐츠를 표시하기 위한 뷰를 생성한다.<br>
데이터 소스 객체를 구현하기 위해서는, UICollectionViewDataSource 프로토콜을 준수하는 객체를 생성해야 한다.<br>

#### UICollectionViewDelegate
컬렉션 뷰로부터 메시지를 받고 뷰의 동작을 정의할 수 있도록 하는 선택적 객체<br>
delegate를 통해 컬렉션 뷰에서의 항목 선택 및 아이템의 하이라이팅을 추적할 수 있다.<br>

<br>

### Presentation
#### UICollectionReusableView
컬렉션 뷰에 표시되는 모든 뷰는 UICollectionViewReusableView 클래스의 인스턴스여야 한다.<br>
이 클래스는 컬렉션 뷰에 의해 사용되는 재사용 매커니즘을 제공한다.<br>
새로운 뷰를 생성하는 대신, 재사용되는 뷰는 일반적으로 성능을 향상시키며, 특히 스크롤 도중 성능을 향상시킨다.<br>

#### UICollectionViewCell
주요 데이터 항목에 사용하는 특정 타입의 재사용 가능한 뷰<br>

<br>

### Layout
#### UICollectionViewLayout
UICollectionViewLayout의 하위 클래스는 layout object라고도 하며, 컬렉션 뷰 내부의 셀 및 재사용 가능한 뷰들의 위치, 사이즈, 시각적인 속성을 결정짓는 역할을 한다.<br>

#### UICollectionViewLayoutAttributes
레이아웃 과정 동안, 레이아웃 객체는 셀 및 재사용 가능한 셀을 어디에, 어떻게 배치할지를 컬렉션 뷰에게 알려주는 레이아웃 속성 객체(UICollectionViewLayoutAttributes의 인스턴스)를 생성한다.<br>

#### UICollectionViewUpdateItem
데이터 항목이 컬렉션 뷰 내에서 삽입, 삭제 또는 이동될 때마다 레이아웃 객체는 UICollectionViewUpdateItem 클래스의 인스턴스를 받는다.<br>

<br>

### Flow Layout
#### UICollectionViewFlowLayout
그리드 또는 다른 line-based 레이아웃을 구현하기 위한 구체적인 레이아웃 객체<br>
해당 클래스를 그대로 사용하거나, 레이아웃 정보를 동적으로 커스터마이즈할 수 있도록 하는 flow delegate object와 함께 사용할 수 있다.<br>

<br>

## Reusable Views

컬렉션 뷰는 효율성을 위해 View Recycling Program을 사용한다.<br>
뷰가 화면에서 벗어나면 삭제되는 대신 뷰가 제거되고 재사용 큐에 배치되며, 새로운 콘텐츠가 화면에 나타날 때 뷰는 큐에서 제거되고 새로운 콘텐츠로 다시 사용된다.<br>
이러한 recycling과 reuse를 위해, 컬렉션 뷰에서 표시되는 모든 뷰들은 UICollectionReusableView 클래스를 상속해야 한다.<br>

<br>

#### Cell
컬렉션 뷰의 주요 콘텐츠를 표시하며, 데이터 소스 객체에서 하나의 항목에 대한 콘텐츠를 표시하는 역할을 한다.<br>
각 셀은 UICollectionViewCell 클래스의 인스턴스로, 필요에 따라 서브 클래스화하여 콘텐츠를 표시할 수 있다.<br>

#### Supplementary Views
섹션에 대한 정보를 표시하며, 필수적이지 않고, 사용 및 배치는 사용 중인 레이아웃 객체에 의해 제어된다.<br>

#### Decoration Views
레이아웃 객체에 완전히 소유되는 시각적 장식 요소로, 데이터 소스 객체의 어떤 데이터와도 연결되지 않는다.<br>

<br>

## Layout Object
레이아웃 객체는 컬렉션 뷰 내 항목들의 배치와 시각적 스타일을 결정하며, 컬렉션 뷰 내의 셀, supplementary view, decoration view의 위치와 크기 및 시각적 모습을 결정한다.<br>
뷰의 투명도, 3D 공간에서의 변형, 다른 뷰 위/아래의 가시성 같은 속성들도 정의할 수 있다.<br>

