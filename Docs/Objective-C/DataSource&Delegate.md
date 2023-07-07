# Data Source & Delegate

## DataSource Protocol

데이터를 요구하는 컴포넌트에게 데이터를 제공한다.<br>
(Ex. UITableView는 DataSource 프로토콜을 통해 테이블에 표시할 데이터를 가져온다.)

- numberOfSectionsInTableView : 테이블 뷰가 몇 개의 섹션으로 구성될지 알려주는 메서드 (기본값 : 1)
- tableView: NumberOfRowsInsection : 특정 섹션에 몇 개의 행이 표시될지 알려주는 메서드
- tableView: cellForRowAtIndexPath : 특정 위치의 셀을 반환하며, 각 셀의 내용을 설정하고 UITableViewCell 객체를 반환하는 메서드

<br> 
## Delegate Protocol

이벤트를 처리하거나 특정 동작을 수행하는데 필요한 정보를 제공한다.<br>
(Ex. UITableView는 사용자 상호작용에 따른 이벤트를 처리하기 위해 UITableViewDelegate 를 사용한다.)

- tableView:didSelectRowAtIndexPath : 사용자가 특정 셀을 탭했을 때 호출된다. 사용자의 선택에 반응하여 특정 동작을 수행할 수 있다.
- tableView: heightForRowAtIndexPath : 각 셀의 높이를 설정한다. (기본 : 44)
- tableView: viewForHeaderInSection : 각 섹션의 헤더와 푸터를 커스텀 뷰로 설정한다.
<br> 
