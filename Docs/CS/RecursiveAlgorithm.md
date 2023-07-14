# 재귀 알고리즘

함수 내부에서 함수가 자기 자신을 또 다시 호출하여 문제를 해결하는 알고리즘<br>
계속해서 자신을 호출하게 되므로 반드시 반복을 중단할 조건이 필요하다.<br>

```
T(n) = T(n-1) + c
	= T(n-2) + 2c
	= T(n-3) + 3c
	= …
	= T(2) + (n-2)c
	= T(1) + (n-1)c
	<= c + (n-1)c = c + cn - c = cn => O(n)
```
이와 같이 팩토리얼을 계산하는 재귀 함수는 점화식을 통해 O(n)임을 알 수 있다.

<br>

### 팩토리얼의 재귀 / 반복문 손코딩
```c
private static int recursiveFactorial(int num) {
	if (num > 1) {
		return recursiveFactorial(num - 1) * num;
	}
	return 1;
}

private static int loopFactorial(int num) {
	int answer = 1;
	for (int i = 2; i <= num; I++) {
		answer *= i; 
	}
	return answer;
}
```

<br>

### 	피보나치 수열 재귀 / 반복문 손코딩
```c
private static int recursiveFibonacci(int index) {
	if (index <= 2) {
		return 1;
	}
	return recursiveFibonacci(index - 1) + recursiveFibonacci(index - 2);
}

private static int loopFibonacci(int index) {
	int answer = 1;
	int before = 1;
	int temp;
	for (int i = 2; i < index, i++) {
		temp = answer;
		answer += before;
		before = temp;
	}
	return answer;
}
```
