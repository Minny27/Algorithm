// 하샤드 수
// 문제 설명
// 양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다. 예를 들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다. 자연수 x를 입력받아 x가 하샤드 수인지 아닌지 검사하는 함수, solution을 완성해주세요.

// 제한 조건
// x는 1 이상, 10000 이하인 정수입니다.
// 입출력 예

public class HarshadNumber {
    public boolean solution(int x) {
        // boolean answer = true;
        // String str_x = Integer.toString(x);
        String str_arr [] = Integer.toString(x).split("");
        // String str_arr1 [] = String.valueOf(x).split("");
        int sum = 0;

        for(int i = 0; i < str_arr.length; i++) {
            sum += Integer.parseInt(str_arr[i]);
        }
        // return answer;
        return x % sum == 0;
    }
    public static void main(String [] args) {
        HarshadNumber hsn = new HarshadNumber();
        System.out.println(hsn.solution(10));
        System.out.println(hsn.solution(12));
        System.out.println(hsn.solution(11));
        System.out.println(hsn.solution(13));
    }
}