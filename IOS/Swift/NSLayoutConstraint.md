# NSLayoutConstraint
제약 조건 기반 레이아웃 시스템에서 연관된 뷰간의 관계에서 충족해야하는 제약조건 클래스

> ### Instance Property
* **var isActive: Bool { get set }**
    - 제약조건의 활성 상태를 나타내는 불값
    ```swift
    subView.leadingCons = closetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    ```

***

> ### Type Method
* **class func activate(_ constraints: [NSLayoutConstraint])**
    - 지정한 배열에서 각 제약 조건을 활성화

* **class func deactivate(_ constraints: [NSLayoutConstraint])**
    - 지정한 배열에서 각 제약 조건을 비활성화
