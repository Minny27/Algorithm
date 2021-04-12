# UIStoryboard
Interface Builder스토리 보드 리소스 파일에 표시된 디자인 타임 뷰 컨트롤러 그래프의 캡슐화한 클래스   
새 뷰 컨트롤러를 만들려면 먼저 UIStoryboard객체를 만들고 적절한 이름과 번들 정보를 지정한다.   
그런 다음 해당 객체를 사용하여 원하는 특정 뷰 컨트롤러를 인스턴스화한다.   
ex) 코드로 작성할 때 특정 view controller의 멤버 변수나 함수를 사용하기 위해서 storyboard객체를 만들고 나서 스토리보드 변수에서 컨트롤러 객체를 생성할 수 있다.   
   
> ### Instance Method
* **instantiateViewController(withIdentifier:)**
    - view controller객체를 생성하기 위해서 storyboard객체로부터 데이터를 초기화하는 함수