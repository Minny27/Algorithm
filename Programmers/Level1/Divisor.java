// 나누어 떨어지는 숫자 배열
// 문제 설명
// array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.
// divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.

// 제한사항
// arr은 자연수를 담은 배열입니다.
// 정수 i, j에 대해 i ≠ j 이면 arr[i] ≠ arr[j] 입니다.
// divisor는 자연수입니다.
// array는 길이 1 이상인 배열입니다.
// 입출력 예
import java.util.ArrayList;
import java.util.Collections;

public class Divisor {
    public int[] solution(int[] arr, int divisor) {
        int[] answer = {};
        ArrayList<Integer> list = new ArrayList<Integer>();

        for (int e : arr) {
            if (e % divisor == 0 && !list.contains(e)) {
                list.add(e);
            } 
            else if (e / divisor == 0) {
                continue;
            }
        }
        if(list.isEmpty()) {
            list.add(-1);
        }

        Collections.sort(list);
        int size = 0;

        for (int j = 0; j < list.size(); j++) {
            System.out.print(list.get(j) + " ");
        }
        System.out.println();

        answer = new int[list.size()];
        for (int i = 0; i < list.size(); i++) {
            answer[size++] = list.get(i);
        }
        return answer;
    }

    public static void main(String[] args) {
        Divisor div = new Divisor();
        System.out.println(div.solution(new int[] { 5, 9, 7, 10 }, 5));
        System.out.println(div.solution(new int[] { 2, 36, 1, 3 }, 1));
        System.out.println(div.solution(new int[] { 3, 2, 6 }, 10));
        System.out.println(div.solution(new int[] { 30, 30, 30 }, 10));
        System.out.println(div.solution(new int[] { 1, 4, 6 }, 2));


    }
}