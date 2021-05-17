# RecyclerView.Adapter

* **public static abstract class RecyclerView.Adapterextends Object**
    - 어댑터는 특정 데이터 집합을 view에 할당하고 Recycleer View 내에 표시되도록 하는 함수

> ### Methods
* **public abstract VH onCreateViewHolder (ViewGroup parent, int viewType)**
    - RecyclerView에 새 RecyclerView가 필요할 때 호출되는 함수

* **public abstract void onBindViewHolder (VH holder, int position)**
    - 지정된 위치에 데이터를 보여주기 위해 RecyclerView에 의해 호출되는 함수

* **public abstract int getItemCount ()**
    - 어댑터가 보유한 데이터 집합의 개수를 반환하는 함수