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

* **public void setCurrentItem (int item)**
    - 현재 선택한 페이지를 설정. ViewPager가 현재 어댑터로 생성된 첫 번째 레이아웃을 넘어갈 경우 현재 레이아웃과 특정 레이아웃 간에 원활한 애니메이션 전환이 이루어짐. 어댑터가 설정되지 않았거나 비어 있으면 자동으로 무시됨.

* **public int getCurrentItem ()**
    - 현재 선택한 페이지를 반환. 어댑터가 없거나 어댑터가 비어 있어 페이지를 제대로 선택할 수 없는 경우 는 0을 반환.