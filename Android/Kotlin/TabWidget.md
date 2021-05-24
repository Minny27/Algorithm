# TabWidget

* **open class TabWidget : LinearLayout, View.OnFocusChangeListener**
    - 상위 탭 컬렉션의 각 페이지를 나타내는 탭 레이블 목록을 표시하는 클래스  
    이 위젯의 컨테이너 객체는 TabHost이다. 사용자가 탭을 선택하면 이 객체는 상위 컨테이너인 TabHost로 메시지를 보내 표시된 페이지를 전환하도록 지시한다.  
    일반적으로 이 객체에는 직접 많은 메서드를 사용하지 않는다. 컨테이너 객체 TabHost는 label을 추가하고 callback handler를 추가하며 콜백을 관리하는 데 사용된다.(탭을 눌르는 이벤트 발생 시)  
    탭 목록을 반복하거나 탭 목록의 레이아웃을 조정하기 위해 이 객체를 호출할 수 있지만 대부분의 메서드는 TabHost 객체에서 호출해야 함