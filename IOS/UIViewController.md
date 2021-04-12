# UIViewController
UIKit 앱의 view 계층을 관리하는 클래스

### Instance Property
* **navigationController**
    - view controller 계층 구조에서 가장 가까운 부모 탐색 컨트롤러
***

### Instance Method
* **pushViewController(_:animated:)**
    - 뷰 컨트롤러를 수신기의 스택에 밀어넣고 디스플레이를 업데이트   
    ex)
    ```swift
    if let controller = self.storyboard?.instantiateViewController(withIdentifier : "DetailController") {
    self.navigationController?.pushViewController(controller, animated: true)
    ```
}


