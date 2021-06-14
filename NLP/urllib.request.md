# urllib.request
urlib.request 모듈은 기본 및 다이제스트 인증, 리디렉션, 쿠키 등 복잡한 환경에서 URL(대부분 HTTP)을 여는 데 도움이 되는 기능과 클래스를 정의한다.

### Methods
* **quote(string, safe='/', encoding=None, errors=None)**
    - URL quote 함수는 특수 문자를 인용하고 ASCII가 아닌 텍스트를 적절히 인코딩하여 프로그램 데이터를 가져와서 URL 구성 요소로 안전하게 사용할 수 있도록 도와준다.  
    또한 위의 URL 구문 분석 기능으로 해당 작업이 아직 적용되지 않은 경우 URL 구성 요소의 내용에서 원본 데이터를 재생성하기 위해 이러한 작업을 되돌릴 수 있다.