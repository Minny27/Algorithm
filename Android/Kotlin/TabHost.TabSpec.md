# TabHost.TabSpec

* **open class TabSpec**
    - 탭에는 tab indicator, content, 그리고 tag가 있습니다. 이 작성기는 이러한 선택사항 중에서 선택할 수 있도록 도와준다.  
    선택사항은 1) 탭의 레이블 설정, 2) view의 id 3) TabContentFactory 4) 화면전환 객체 intent 등

> ### Methods
* **open fun setIndicator(label: CharSequence!, icon: Drawable!): TabHost.TabSpec!**
    - tab indicator에 제목과 아이콘을 지정