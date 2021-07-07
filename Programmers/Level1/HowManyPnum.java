
// 소수 찾기
// 문제 설명
// 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.

// 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
// (1은 소수가 아닙니다.)

// 제한 조건
// n은 2이상 1000000이하의 자연수입니다.
import java.util.ArrayList;

public class HowManyPnum {
    public int solution(int n) {
        int answer = 0;
        // 소수는 1, 소수가 아닌 수는 0
        ArrayList<Boolean> list = new ArrayList<Boolean>(n + 1);

        // 0, 1은 소수가 아님
        list.add(false);
        list.add(false);

        // 2 ~ n 까지 소수로 가정하고 1을 대입
        for (int i = 2; i <= n; i++)
            list.add(true);

        // 소수가 아닌 배수들은 모두 0 대입
        for (int i = 2; (i * i) <= n; i++) {
            for (int j = i * i; j <= n; j += i)
                list.set(j, false);
        }

        for (int i = 0; i < list.size(); i++)
            if (list.get(i) == true)
                answer += 1;
        return answer;
    }

    public static void main(String[] args) {
        HowManyPnum hmp = new HowManyPnum();
        System.out.println(hmp.solution(10));
        System.out.println(hmp.solution(5));
    }
}

// 실행시간 초과
// if (n == 2) return 1;
// int answer = 1;
// for (int i = 3; i <= Math.sqrt(n); i++) {
// for (int j = 2; j < ; j++) {
// if (i % j == 0)
// break;
// else if (j == Math.round(Math.sqrt(n)) -1)
// answer += 1;
// }
// }
