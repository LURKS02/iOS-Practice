# MSA (Microservice Architecture)
모든 시스템의 구성요소가 한 프로젝트에 통합되어 있는 Monolithic Architecture (모놀리식 아키텍처)의 한계점을 극복하고자 등장하였다.<br>
1개 시스템을 독립적으로 배포 가능한 각각의 서비스로 분할하고, 각 서비스는 API를 통해 데이터를 주고받으며 1개의 큰 서비스를 구성한다.<br>

### 장점
- 일부 서비스에 장애가 발생하더라도 전체 서비스에 장애가 발생하지 않는다.<br>
- 각 서비스들이 서로 다른 언어와 프레임워크로 구성될 수 있다.<br>
- 서비스의 확장이 용이하다.<br>

### 단점
- 서비스가 분리되어 있어 테스팅 및 트랜잭션 처리가 어렵다.<br>
- 서비스 간에 API로 통신하기 때문에 그에 대한 비용이 발생한다.<br>
- 서비스 간의 호출이 연속적이므로 디버깅 및 에러 트레이싱이 어렵다.<br>

