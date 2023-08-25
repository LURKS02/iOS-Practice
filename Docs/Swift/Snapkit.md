## 제약 조건 설정

```jsx
view.snp.makeConstraints { make in
	make.top.equalToSuperview().offset()
	make.left.equalToSuperview().offset()
	make.right.equalToSuperview().offset()
	make.height.equalTo()
}
```

뷰에 제약 조건을 추가하기 위해 **snp** 프로퍼티를 통해 **make** 클로저를 호출한다.

## 업데이트

```jsx
view.snp.updateConstraints { make in
	make.height.equalTo()
}
```

기존의 제약 조건을 수정하려면 **snp.updateConstraints** 를 사용한다.

## 리메이크

```jsx
view.snp.remakeConstraints { make in
	make.edges.equalToSuperview()
}
```

제약 조건을 완전히 재설정하려면 **snp.remakeConstraints** 를 사용한다.

## 다른 뷰와의 관계 설정

```jsx
secondView.snp.makeConstraints { make in
	make.top.equalTo(firstView.snp.bottom).offset()
	make.left.equalTo(firstView)
	make.width.height.equalTo(firstView)
}
```

## 제약 조건의 우선 순위

```jsx
view.snp.makeConstraints { make in
	make.left.eqaulToSuperview().offset().priority()
}
```

## Center와 Size

```jsx
view.snp.makeConstraints { make in
	make.center.equalToSuperview()
	make.size.equalTo(CGSize(width: 100, height: 100))
}
```

## Edges

```jsx
view.snp.makeConstraints { make in
	make.edges.equalToSuperview()
}
```

**edges** 를 통해 모든 가장자리를 동시에 설정할 수 있다.
