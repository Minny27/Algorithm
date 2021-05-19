# SharedPreferences.Editor
> ### 기본 형태
* **public static interface SharedPreferences.Editor**
    - 객체(파일)에 있는 값을 변경할 때 사용하는 인터페이스. 변경된 내용은 commit() 또는 apply()를 이용해서 일괄 처리할 수 있다.

***
> ### Methods
* **public abstract SharedPreferences.Editor putString (String key, String value)**
    - 에디터에 키, 값의 형태로 변경된 내용을 저장, commit() 또는 apply()를 통해서 일괄처리한다.
