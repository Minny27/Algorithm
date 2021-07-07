import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 1008번
public class Div {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // double a = Character.getNumericValue(br.read());
        // br.read();
        // double b = Character.getNumericValue(br.read());
        // String s[] = br.readLine().split(" ");
        // 콤마로 토큰을 나누는 기준을 정할 수 있다는 것을 알았다.
    
        StringTokenizer st = new StringTokenizer(br.readLine(), "\n");
            // for(int i = 0; i < 2; i++)
        // double a = Double.parseDouble(st.nextToken());
        // double b = Double.parseDouble(st.nextToken());
        System.out.println(Double.parseDouble(st.nextToken()) / Double.parseDouble(st.nextToken()));
        // System.out.println(Double.parseDouble(s[0]) / Double.parseDouble(s[1]));
    }
}
