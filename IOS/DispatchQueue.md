# DispatchQueue
앱의 기본 스레드 또는 백그라운드 스레드에서 작업 실행을 직렬 또는 동시에 관리하는 클래스
ex) API를 활용해서 Json data를 가져오는 것과 동시에 데이터를 화면에 적재시킬 때

> ### Type Property
* **navigationController**
    - 현재 프로세스의 메인 스레드와 연결된 디스패치 큐

***

> ### Instance Method
* **async(execute:)**
    - 작업 항목을 즉시 실행하도록 예약하고 즉시 반환합니다.
