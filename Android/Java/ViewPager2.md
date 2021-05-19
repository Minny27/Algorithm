# ViewPager2
ViewPager2는 ViewPager를 대체하여 오른쪽에서 왼쪽으로 배치 지원, 수직 방향, 수정 가능한 fragment 등을 포함한 이전의 대부분의 문제를 해결 할 수 있는 클래스

> ### Methods
* **public void setAdapter (Adapter adapter)**
    - 좌우 페이지로 넘어갈 시, page views를 제공하도록 새 어댑터를 설정  
    Fragments로 사용하려는 경우 FragmentStateAdapter로 구현하고, pages가 Views인 경우, RecyclerView.Adapter로 구현.