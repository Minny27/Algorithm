import java.io.*;
import java.util.StringTokenizer;

// 1712	
// 손익분기점	
public class BreakEvenPoint {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken()); // 고정비
        int b = Integer.parseInt(st.nextToken()); // 변동비
        int c = Integer.parseInt(st.nextToken()); // 판매가격

        // 변동비가 판매가격보다 크거나 같을 때
        if(b >= c) System.out.println(-1);
        else System.out.println(a / (c - b) + 1);
    }
}
