# SharedPreferences
> ### 기본 형태
* **public interface SharedPreferences**
    - 액티비티를 나갔을 때 액티비티를 나가기 전의 데이터를 보존하기 위한 인터페이스

> ### Methods
* **public abstract SharedPreferences.Editor edit ()**
    - 변경된 내용을 저장하고 전달하는 함수

* **public abstract String getString (String key, String defValue)**
    - 에디터에서 putString했던 키와 값을 받은 preferences에 저장된 값을 반환