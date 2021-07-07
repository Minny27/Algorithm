import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.StringTokenizer;

// 1365
// 꼬인 전깃줄 

public class TwistedWire {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        StringTokenizer st = new StringTokenizer(br.readLine());
        ArrayList<Integer> list1 = new ArrayList<>(); // 모든 입력 값 저장
        ArrayList<Integer> list2 = new ArrayList<>(); // 정답이 되는 값 저장

        // 먼저 연결된 전기 줄 리스트를 생성 후 값 넣기
        for (int i = 0; i < n; i++)
            list1.add(Integer.parseInt(st.nextToken()));


        // list1에 있는 인덱스 하나씩 비교해서 list1의 last 인덱스에 있는 값보다 크면 추가
        list2.add(list1.get(0));
        for (int i = 1; i < n; i++) {
            int last = list2.get(list2.size() - 1);
            if(list1.get(i) > last) {
                list2.add(list1.get(i));
                continue;
            }
            // 작으면 BinarySearch로 만약에 들어갔다면 어느 위치에 들어가는지 확인하고 -tmp - 1 위치의 값을 지우고 넣기
            else {
                int tmp = Collections.binarySearch(list2, list1.get(i));
                list2.remove(-tmp - 1);
                list2.add(-tmp - 1, list1.get(i));
            }
        }
        System.out.println(n - list2.size());
    }
}

// 시간 복잡도 n ^ 2... 시간 초과...
// public class TwistedWire {
// public static void main(String[] args) throws IOException {
// BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
// int n = Integer.parseInt(br.readLine());
// StringTokenizer st = new StringTokenizer(br.readLine());
// ArrayList<Integer> list = new ArrayList<>();

// // LIS 알고리즘을 이용
// for(int i = 0; i < n; i++) {
// int nstWire = Integer.parseInt(st.nextToken()); // i + 1번째 전선에 연결된 전기줄

// if(list.isEmpty())
// list.add(nstWire);

// else {
// for(int j = list.size() - 1; j >= 0; j--) {
// // 연결된 전기줄이 저장된 list의 원소보다 작을 때
// if(nstWire < list.get(j)){
// if(j == 0) {
// list.remove(0);
// list.add(0, nstWire);
// }
// continue;
// }
// // 연결된 전기줄이 저장된 list의 원소보다 클 때
// else {
// if(j == list.size() - 1) {
// list.add(nstWire);
// break;
// }

// else {
// list.remove(j + 1);
// list.add(j + 1, nstWire);
// break;
// }
// }
// }
// }
// }
// System.out.println(n - list.size());
// }
// }
