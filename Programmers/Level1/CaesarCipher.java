// 시저 암호
// 문제 설명
// 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 AB는 1만큼 밀면 BC가 되고, 3만큼 밀면 DE가 됩니다. z는 1만큼 밀면 a가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.

// 제한 조건
// 공백은 아무리 밀어도 공백입니다.
// s는 알파벳 소문자, 대문자, 공백으로만 이루어져 있습니다.
// s의 길이는 8000이하입니다.
// n은 1 이상, 25이하인 자연수입니다.
public class CaesarCipher {
    public String solution(String s, int n) {
        char c_arr[] = s.toCharArray();

        for (int i = 0; i < c_arr.length; i++) {
            int ascii_num = (int) c_arr[i];

            if (ascii_num >= 65 && ascii_num <= 90) {
                // 대문자 'Z'에서 넘어갈 때
                if (ascii_num + n > 90 && ascii_num + n <= 115) {
                    c_arr[i] = (char) (ascii_num + n - 26);
                }
                // 대문자 'Z'에서 넘지 않을 때
                else if (ascii_num + n >= 65 && ascii_num + n <= 90) {
                    c_arr[i] = (char) (ascii_num + n);
                }
            }

            else if (ascii_num >= 97 && ascii_num <= 122) {
                // 소문자 'z'에서 넘어갈 때
                if (ascii_num + n > 122) {
                    c_arr[i] = (char) (ascii_num + n - 26);
                }
                // 소문자 'z'에서 넘지 않을 때
                else if (ascii_num + n >= 97 && ascii_num + n <= 122) {
                    c_arr[i] = (char) (ascii_num + n);
                }
            } else {
                continue;
            }
        }
        return String.valueOf(c_arr);
        // return c_arr.toString();
    }

    public static void main(String[] args) {
        CaesarCipher cc = new CaesarCipher();
        System.out.println(cc.solution("AB", 1));
        System.out.println(cc.solution("z", 1));
        System.out.println(cc.solution("Z", 10));
        System.out.println(cc.solution("a B z", 4));
        System.out.println(cc.solution(" aBZ", 20));
        System.out.println(cc.solution("y X Z", 4));
        System.out.println(cc.solution(" . h z", 20));
        char c = 'z';
        System.out.println(c - 'a' + 5);
        
    }
}