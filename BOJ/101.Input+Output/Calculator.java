import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 10869
// 문제에서 a,b는 자연수라고 언급했다.
public class Calculator {
    public static void main(String[] args) throws IOException {
        // 한 줄로 입력 받는 코드를 배웠다.
        // String[] param = new BufferedReader(new InputStreamReader(System.in)).readLine().split(" ");
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken());
        int b = Integer.parseInt(st.nextToken());
        System.out.println(a + b);
        System.out.println(a - b);
        System.out.println(a * b);
        System.out.println(a / b); // 몫
        System.out.println(a % b); // 나머지
    }
}
