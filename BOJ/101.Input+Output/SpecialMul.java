import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// 2588
// 두번째 수는 String으로 저장해서 substring으로 출력
public class SpecialMul {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int a = Integer.parseInt(br.readLine()); // 첫 번째 수 저장
        String s = br.readLine(); // 두 번째수는 String으로 저장

        // s의 substring으로 2번째 인덱스부터 줄이면서 곱셈 후 출력
        for(int i = s.length(); i > 0; i--) {
            int n = Integer.parseInt(s.substring(i - 1, i));
            System.out.println(a * n);            
        }
        System.out.println(a * Integer.parseInt(s));
    }
}
