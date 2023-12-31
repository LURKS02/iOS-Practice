# Dynamic Programming

동적 프로그래밍(Dynamic Programming)이란, 주어진 문제를 풀기 위해 문제를 여러 개의 하위 문제(subproblem)로 나누어 푼 다음, 그것을 결합하여 문제를 해결하는 방식이다.<br>
어떤 부분 문제가 다른 문제들을 해결하는데 사용될 수 있어, 답을 여러 번 계산하는 대신 한 번만 계산하고 해당 결과를 재활용하는 메모이제이션(Memoization) 기법으로 속도를 향상시킬 수 있다.<br>
동적 프로그래밍으로 문제를 해결하기 위해서는 문제가 다음의 조건을 만족해야 한다.<br>
- Overlapping Subproblem(중복되는 부분문제) : 주어진 문제는 같은 부분 문제가 여러번 재사용된다.<br>
- Optimal Substructure(최적 부분구조) : 새로운 부분 문제의 정답을 다른 부분 문제의 정답으로부터 구할 수 있다.<br>


