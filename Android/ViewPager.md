# ViewPager
사용자가 데이터 페이지를 왼쪽과 오른쪽으로 넘길 수 있는 레이아웃 관리자 클래스  
어댑터를 제공하여 뷰에 페이지를 생성할 수 있도록 함.

> ### ViewPager 1, 2의 차이
- 1은 탭바 형태
- 2는 탭바없이 그냥 넘어가는 형태 -> Indicator와 함께 사용

> ### Methods
* **public void registerOnPageChangeCallback (ViewPager2.OnPageChangeCallback callback)**
    - 페이지가 변경되거나 스크롤이 증가할 때마다 호출되는 함수  
    콜백을 추가하는 구성 요소는 콜백이 완료되면 해당 콜백을 제거해야 함
