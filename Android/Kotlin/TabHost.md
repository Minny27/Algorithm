# TabHost

* **open class TabHost : FrameLayout, ViewTreeObserver.OnTouchModeChangeListener**
    - 탭으로 된 view를 위한 컨테이너 클래스. 이 객체는 탭 레이블 집합과 해당 페이지의 내용을 표시하는 프레임 레이아웃 객체 두 개의 하위 항목이 있다. 이 두 요소는 일반적으로 하위 요소 자체에 값을 설정하는 대신 이 컨테이너 객체를 사용하여 제어됨

***

> ### TabHost 제약조건
    1. 레이아웃에서 tabhost를 생성할 때 id를 tabhost로 생성해야함(@android:id/tabhost)  
    2. 탭에 해당하는 view를 생성할 때는 FrameLayout으로 생성해야하고 이름은 tabcontent여야함(@android:id/tabcontent)  
    3. 탭을 만들 때는 TabWidget으로 생성해야하며 이름은 tabs(@android:id/tabs)

***

> ### Methods
* **open fun setup(): Unit**
    - FindViewById()를 사용하여 TabHost를 초기화하는 경우 탭을 추가하기 전에 setup()함수를 호출해야한다.  
    단, TabActivity에서 getTabHost() 후 setup()을 호출할 필요는 없음.  
    실제로 사용할 때는 setup함수에 localActivityManager객체로 초기화한다.
    ```kotlin
    ex)
        val tabHost = findViewById<TabHost>(android.R.id.tabhost)
        tabHost.setup(this.localActivityManager)
    ```

* **open fun newTabSpec(tag: String): TabHost.TabSpec**
    - 이 탭 호스트와 연결된 새 TabSpec을 생성하는 함수. tab에 들어갈 내용 혹은 탭과 연결된 액티비티를 설정하는 함수

* **open fun addTab(tabSpec: TabHost.TabSpec!): Unit**
    - tabhost에 탭을 추가하는 함수