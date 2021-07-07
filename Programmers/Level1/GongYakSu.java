// 최대공약수와 최소공배수
// 문제 설명
// 두 수를 입력받아 두 수의 최대공약수와 최소공배수를 반환하는 함수, solution을 완성해 보세요. 배열의 맨 앞에 최대공약수, 그다음 최소공배수를 넣어 반환하면 됩니다. 예를 들어 두 수 3, 12의 최대공약수는 3, 최소공배수는 12이므로 solution(3, 12)는 [3, 12]를 반환해야 합니다.

// 제한 사항
// 두 수는 1이상 1000000이하의 자연수입니다.

// 입출력 예
// n	m	return
// 3	12	[3, 12]
// 2	5	[1, 10]

public class GongYakSu {
    public int[] solution(int n, int m) {
        int[] answer = new int[2];
        int big = Math.max(n,m);
        int small = Math.min(n,m);

        answer[0] = gcd(big,small);
        answer[1] = big*small/answer[0];
        System.out.print(answer[0] + " ");
        System.out.print(answer[1] + " ");

        return answer;
    }
    public int gcd(int a,int b){
        if(a % b == 0)
            return b;
        return gcd(b,a%b);
    }
    public static void main(String[] args) {
        GongYakSu gys = new GongYakSu();
        System.out.println(gys.solution(2, 3));
    }
}