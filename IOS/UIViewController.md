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
    }
    ```

* **viewDidLoad()**
    - 뷰 컨트롤러가 메모리에 로딩된 후 호출되는 함수   
    viewDidLoad 메소드는 뷰의 로딩이 완료 되었을 때 시스템에 의해 자동으로 호출되기 때문에    
    일반적으로 **리소스를 초기화하거나 초기 화면을 구성하는 용도**로 주로 사용한다.   
    화면이 처음 만들어질 때 한 번만 실행되므로, 처음 한 번만 실행해야 하는 초기화 코드가 있을 경우 이 메소드 내부에 작성하면 된다.   
    출처: https://zeddios.tistory.com/43 [ZeddiOS]

* **dismiss(animated:completion:)**
    - 현재의 view controller를 닫는 함수   
    ex) 
    ```swift
    self.dismiss(animated: true, completion: nil)
    ```

