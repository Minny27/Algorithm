# ArrayAdapter
리스트 객체와 리스트 뷰를 연결시켜서 리스트 형태의 데이터를 보여주기 위한 클래스

> ### Method
* **public ArrayAdapter (Context context, int resource, List<T> objects)**
    - 어댑터의 생성자   
    ex)
    ```java
    ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, data);
    ```
* **public void notifyDataSetChanged()**
    - 변경된 데이터가 있다는 것을 알리는 함수
