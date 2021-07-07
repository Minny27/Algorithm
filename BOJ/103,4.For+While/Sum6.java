import java.io.*;
import java.util.StringTokenizer;

// 11022
// A+B - 8
public class Sum6 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine()); // n개의 줄
        StringBuilder sb = new StringBuilder();
        int result, a, b; // sb에서는 '+' 를 string + string으로 간주
        
        for(int i = 1; i <= n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            a = Integer.parseInt(st.nextToken());
            b = Integer.parseInt(st.nextToken());
            result = a + b;
            // sb.append("Case #" + i + ": " + a + " + " + b + " = " + result + "\n");
			sb.append("Case #").append(i).append(": ").append(a)
            .append(" + ").append(b).append(" = ").append(a+b).append("\n");
        }
        System.out.print(sb);
    }
}
