# ViewGroup.MarginLayoutParams
여백을 지원하는 레이아웃에 대한 자식별 레이아웃 정보를 담는 클래스

> ### Methods
* **public void setMargins (int left, int top, int right, int bottom)**
    - 여백을 픽셀 단위로 설정. View.requestLayout()에 대한 호출을 수행하여 새 여백을 고려해야 함.  
    레이아웃 방향에 따라 왼쪽 및 오른쪽 여백이 View.requestLayout()으로 재정의될 수 있음. 여백 값은 양수 값이어야함