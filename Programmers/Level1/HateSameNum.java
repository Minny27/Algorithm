
// 같은 숫자는 싫어
// 문제 설명
// 배열 arr가 주어집니다. 배열 arr의 각 원소는 숫자 0부터 9까지로 이루어져 있습니다. 이때, 배열 arr에서 연속적으로 나타나는 숫자는 하나만 남기고 전부 제거하려고 합니다. 단, 제거된 후 남은 수들을 반환할 때는 배열 arr의 원소들의 순서를 유지해야 합니다. 예를 들면,

// arr = [1, 1, 3, 3, 0, 1, 1] 이면 [1, 3, 0, 1] 을 return 합니다.
// arr = [4, 4, 4, 3, 3] 이면 [4, 3] 을 return 합니다.
// 배열 arr에서 연속적으로 나타나는 숫자는 제거하고 남은 수들을 return 하는 solution 함수를 완성해 주세요.

// 제한사항
// 배열 arr의 크기 : 1,000,000 이하의 자연수
// 배열 arr의 원소의 크기 : 0보다 크거나 같고 9보다 작거나 같은 정수

// 아이디어 : for 문을 통해서 총 길이-1 만큼 비교를 하며 같으면 지우기
import java.util.ArrayList;

public class HateSameNum {
    public int[] solution(final int[] arr) {
        int[] answer = {};
        ArrayList<Integer> list = new ArrayList<Integer>();
        list.add(arr[0]);
        for (int i = 0; i < arr.length - 1; i++) {
            if (arr[i] == arr[i + 1] && !list.contains(arr[i])) {
                list.add(arr[i]);
            } else if (arr[i] != arr[i + 1]) {
                list.add(arr[i + 1]);
            }
        }
        answer = new int[list.size()];
        int size = 0;
        for (int e = 0; e < list.size(); e++) {
            answer[size++] = list.get(e);
        }
        return answer;
    }

    public static void main(String[] args) {
        HateSameNum hsn = new HateSameNum();
        System.out.println(hsn.solution(new int[] { 1, 1, 3, 3, 0, 1, 1 }));
        System.out.println(hsn.solution(new int[] { 4, 4, 4, 3, 3 }));
        System.out.println(hsn.solution(new int[] { 1, 2, 3, 3, 4 }));
        System.out.println(hsn.solution(new int[] { 4, 3, 3, 3, 1 }));

    }

}

// iterator로 구현하려다 실패
// ArrayList<Integer> list_read = new ArrayList<Integer>();
// ArrayList<Integer> list_remove = new ArrayList<Integer>(list_read);

// for (int i = 0; i < arr.length; i++) {
// list_read.add(arr[i]);
// list_remove.add(arr[i]);
// }
// for (int e : list_read) {
// System.out.print(e + " ");
// }

// System.out.println();

// // Collections.copy(list_remove, list_read);

// Iterator<Integer> iter = list_read.iterator();
// int i = 0;
// Integer p = iter.next();
// System.out.println(p);

// while (iter.hasNext()) {
// p = iter.next();
// System.out.println(p);

// while (p.equals(list_remove.get(i))) {
// if (!p.equals(iter.next())) {
// p = iter.next();
// System.out.println(p);
// }
// list_remove.remove(i);
// for (int e : list_remove) {
// System.out.print(e + " ");
// }
// System.out.println();
// }
// i += 1;
// }
// int size = 0;
// for (int e : list_remove) {
// answer[size++] = e;
// }

// 효율성 실패...
// public int[] solution(final int[] arr) {
// int[] answer = {};
// int number_of_remove = 0;
// ArrayList<Integer> list = new ArrayList<Integer>();

// for (int k = 0; k < arr.length; k++) {
// list.add(arr[k]);
// }

// for (int i = 0; i < arr.length - 1; i++) {
// if (arr[i] == arr[i + 1]) {
// list.remove(i + 1 - number_of_remove);
// number_of_remove += 1;
// }
// }
// answer = new int[list.size()];
// int size = 0;
// for (int e = 0; e < list.size(); e++) {
// answer[size++] = list.get(e);
// }
// return answer;
// }