// 이상한 문자 만들기
// 문제 설명
// 문자열 s는 한 개 이상의 단어로 구성되어 있습니다. 각 단어는 하나 이상의 공백문자로 구분되어 있습니다. 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.

// 제한 사항
// 문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
// 첫 번째 글자는 0번째 인덱스로 보아 짝수번째 알파벳으로 처리해야 합니다.

public class StrangeChar {
    public String solution(String s) {
        String answer = "";
        String s_arr [] = s.split("");
        int odd_even = 0; // 단어가 짝수냐 홀수냐

        for(int i = 0; i < s_arr.length; i++) {
            if(s_arr[i].equals(" ") && odd_even % 2 == 0) {
                odd_even += 1;
            }

            if(odd_even % 2 == 0) {
                answer = answer.concat(s_arr[i].toUpperCase());
                odd_even += 1;
            }
            else if(odd_even % 2 == 1) {
                answer = answer.concat(s_arr[i].toLowerCase());
                odd_even += 1;
            }
        }

        return answer;
    }
    public static void main(String [] args) {
        StrangeChar sc = new StrangeChar();
        System.out.println(sc.solution("tryy helloo world"));
        System.out.println(sc.solution(" "));
        System.out.println(sc.solution(""));
        System.out.println(sc.solution("Try Hello WOrld"));


    }
}