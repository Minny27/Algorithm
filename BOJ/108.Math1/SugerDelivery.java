import java.io.*;
import java.util.*;

// 2839		
// 설탕 배달		
public class SugerDelivery {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken());

        if (a == 1 || a == 2 || a == 4 || a == 7)
            System.out.println(-1);
        else if (a % 5 == 0)
            System.out.println(a / 5); // 5로 나눈 나머지 0
        else if (a % 5 == 1 || a % 5 == 3)
            System.out.println(a / 5 + 1); // 5로 나눈 나머지
        else if (a % 5 == 2 || a % 5 == 4)
            System.out.println(a / 5 + 2); // 5로 나눈 나머지
    }
    /*
     * 6 9 10 5와 3을 각각 나눠서 분배하는 수 안 되는 수 : 4 7 5의 개수 3의 개수 총개수 나머지 1 11 16 21 26 5로
     * 나눈 몫 - 1 2 몫 + 1 5 6 10 6 15 6 20 6
     * 
     * 2 12 17 22 27 5로 나눈 몫 - 2 4 몫 + 2 12 5 12 10 12 15 12
     * 
     * 4 14 19 24 29 5로 나눈 몫 - 1 3 몫 + 2 5 9 10 9 15 9 20 9
     */

    // import java.util.*;

    // public int[] solution(String s) {
    // int[] answer = new int[2];
    // String s1 = new String();
    // int numOfC = 0;
    // int numOfZ = 0;

    // while (true) {
    // for (int i = 0; i < s.length(); i++) {
    // if (s.charAt(i) == '1')
    // s1 += "1";
    // else
    // numOfZ++;
    // }

    // int len = s1.length();
    // int len1 = s1.length();
    // s1 = "";
    // while (len > 1) {
    // if (len % 2 == 0)
    // s1 = "0".concat(s1);
    // else
    // s1 = "1".concat(s1);
    // len = len / 2;
    // if(len == 1) s1 = "1".concat(s1);
    // }

    // numOfC++;
    // if (s1.length() == 1 || len1 == 1) break;

    // s = new String(s1);
    // s1 = "";
    // }
    // answer[0] = numOfC;
    // answer[1] = numOfZ;

    // return answer;
    // }

    // public static void main(String[] args) throws IOException {
    // SugerDelivery s = new SugerDelivery();
    // System.out.println(s.solution("1111111")[0]);
    // System.out.println(s.solution("1111111")[1]);
    // }
    //  String을 String에 복사할 때는 String s = new String(s1); 을 잊지 말자
    // 그리고 String을 역순으로 배치할 때는 "1".concat(s); 를 잊지 말자
}
