import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 2884
public class Alram {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken());
        int b = Integer.parseInt(st.nextToken());

        // 이전 코드랑 무슨 차이인지는 잘 모르겠지만 변경하니까 돌았갔다..
        if (b >= 45) System.out.print(a + " " + (b - 45));
        else if (a == 0 && b < 45) System.out.print(23 + " " + (b + 15));
        // 이전 코드
        // else if (b < 45) {
        //     if (a == 0) System.out.print(23 + " " + (b + 15));
        else System.out.print(a - 1 + " " + (b + 15));
        // 입력값 00 45
        // 입력값 00 46
        // 입력값 01 46
        // 입력값 01 44
        // 입력값 8 46
        // 입력값 08 46
    }
}
