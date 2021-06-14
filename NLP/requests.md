# requests
requests 모듈은 HTTP/1.1 요청을 매우 쉽게 전송할 수 있다. URL에 쿼리 문자열을 수동으로 추가하거나 PUT & POST 데이터를 포맷할 필요가 없다.

> 참고 출처
- <https://pypi.org/project/requests/>

### Methods
* **get(url: Union[str, bytes], params: Union[Mapping[Union[str, bytes, int, float]]], **kwargs)**
    - 요청을 보내고자하는 url에 해시 테이블 params를 매개변수로 넘겨서 해당 url 주소로 http 요청을 보내는 함수  
    정상적인 요청 결과로는 <Response 200>이 출력됨.