# Handler
핸들러를 사용해서 스레드의 메시지 큐와 연결된 스레드 객체 및 메시지를 보내거나 처리할 수 있는 클래스

> ### Methods
* **Handler()**
    - 생성자는 선언은 되나 사용되지 않음

* **public final void removeCallbacks (Runnable r)**
    - 현재 메시지 큐에 있는 Runnable 객체를 제거하는 함수

* **public final boolean postDelayed (Runnable r, long delayMillis)**
    - 지정된 시간이 경과한 후 메시지 큐에 Runnable 객체를 추가하는 함수. runnable은 핸들러와 연결된 스레드에서 실행됨
