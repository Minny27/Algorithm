
// 약수의 합
// 문제 설명
// 정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.

// 제한 사항
// n은 0 이상 3000이하인 정수입니다.

public class SumOfDivisor {
    public int solution(int num) {
        // int answer = 0;

        // if(n == 0) return 0;
        // else if(n == 1) return 1;

        // for(int i=1; i<n+1; i++) {
        // if(n % i == 0) {
        // answer += i;
        // }
        // }
        // return answer;
        int answer = 0;
        for (int i = 1; i <= num / 2; i++) {
            if (num % i == 0)
                answer += i;
        }
        return answer + num;
    }

    public static void main(String[] args) {
        SumOfDivisor sod = new SumOfDivisor();
        System.out.println(sod.solution(11));
        System.out.println(sod.solution(5));
    }
}