# Posing

프로그램 내에서 한 클래스가 다른 클래스를 완전히 대체할 수 있도록 한다.<br>
대체하는 클래스는 대상 클래스에 대하여 “pose as” 라고 한다.<br>
pose 기능이 지원되면 대상 클래스로 보내지는 모든 메시지가 대체 클래스에서 수신된다.<br>
NSObject 에서는 기존 클래스를 대체할 수 있도록 poseAsClass 메서드를 포함하고 있다.

#### posing 의 제한사항
- 하나의 클래스는 해당 클래스의 직/간접적인 슈퍼 클래스 중 하나로만 pose as 될 수 있다.
- posing 클래스는 target 클래스에 없는 새로운 인스턴스 변수를 정의할 수 없다. (메서드를 정의하거나 override하는 것은 가능하다.)
- target 클래스는 posing 되기 전에 어떠한 메시지도 수신하지 않았어야 한다.
- posing 클래스는 super를 통하여 overriden 메서드를 호출할 수 있으므로 target 클래스의 implementation을 포함할 수 있다.
- posing 클래스는 카테고리에서 정의된 메서드를 override 할 수 있다.
