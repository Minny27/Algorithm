// 자연수 뒤집어 배열로 만들기
// 문제 설명
// 자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.

// 제한 조건
// n은 10,000,000,000이하인 자연수입니다.
public class ReverseNum {
    public int[] solution(long n) {

        String str_n [] = String.valueOf(n).split("");
        int[] answer = new int[str_n.length];

        for(int i = 0; i < str_n.length; i++) {
            answer[i] = Integer.parseInt(str_n[str_n.length - 1 - i]);
            System.out.print(answer[i] + " ");
        } 

        return answer;
    }    
    public static void main(String [] args){
        ReverseNum rn = new ReverseNum();
        System.out.println(rn.solution(2147483647));

    }
}