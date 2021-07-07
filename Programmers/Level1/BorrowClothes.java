// 체육복
// 문제 설명
// 점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다. 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.

// 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.

// 제한사항
// 전체 학생의 수는 2명 이상 30명 이하입니다.
// 체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
// 여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
// 여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
// 여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.

// lost 제외 -> 1명 예외 처리, 잃어버리고 여분이 같은 사람 예외 처리, 
import java.util.ArrayList;

public class BorrowClothes {
    public int solution(int n, int[] lost, int[] reserve) {
        int answer = 0;
        ArrayList<Integer> is_lost = new ArrayList<Integer>();
        ArrayList<Integer> is_reserve = new ArrayList<Integer>();

        for (int i = 0; i < n; i++) {
            is_lost.add(0);
            is_reserve.add(0);
        }

        for (int i = 0; i < lost.length; i++) {
            is_lost.set(lost[i] - 1, 1);
        }

        for (int i = 0; i < reserve.length; i++) {
            is_reserve.set(reserve[i] - 1, 1);
        }

        for (int i = 0; i < n; i++) {
            if (is_reserve.get(i) == 1 && is_lost.get(i) == 1) {
                is_lost.set(i, 0);
                is_reserve.set(i, 0);
            }

            if (i != n - 1 && (is_reserve.get(i + 1) == 1 && is_lost.get(i + 1) == 1)) {
                is_lost.set(i + 1, 0);
                is_reserve.set(i + 1, 0);
            }

            // i - 1 비교
            if (i - 1 >= 0) {
                if (is_reserve.get(i - 1) == 1 && is_lost.get(i) == 1) {
                    is_lost.set(i, 0);
                    is_reserve.set(i - 1, 0);
                }

            }

            // i + 1 비교
            if (i + 1 < n) {
                if (is_reserve.get(i + 1) == 1 && is_lost.get(i) == 1) {
                    is_lost.set(i, 0);
                    is_reserve.set(i + 1, 0);
                }
            }
        }
        for (int e : is_lost) {
            if (e == 0)
                answer += 1;
        }
        return answer;
    }

    public static void main(String[] args) {
        BorrowClothes bc = new BorrowClothes();
        System.out.println(bc.solution(5, new int[] { 2, 4 }, new int[] { 1, 3, 5 }));  // 5
        System.out.println(bc.solution(5, new int[] { 2, 4 }, new int[] { 3 }));        // 4
        System.out.println(bc.solution(3, new int[] { 3 }, new int[] { 1 }));           // 2
        System.out.println(bc.solution(5, new int[] {}, new int[] { 1 }));              // 5
        System.out.println(bc.solution(5, new int[] { 3 }, new int[] {}));              // 4
        System.out.println(bc.solution(5, new int[] { 1, 5 }, new int[] { 3 }));        // 3
        System.out.println(bc.solution(5, new int[] { 1, 3 }, new int[] { 2, 4 }));     // 5
        System.out.println(bc.solution(5, new int[] { 3, 5 }, new int[] { 2, 4 }));     // 5
        System.out.println(bc.solution(5, new int[] { 1, 4 }, new int[] { 3 }));        // 4
    }
}

// 코드 구상
// index 0 1 2 3 4
// is_lost 0 1 0 1 0
// is_reserve 0 0 1 0 1

// i - 1 비교 1 2 3 4
// i + 1 비교0 1 2 3