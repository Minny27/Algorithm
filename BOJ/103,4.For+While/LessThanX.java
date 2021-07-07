import java.io.*;
import java.util.StringTokenizer;

// 10871 
// X보다 작은 수
public class LessThanX {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken()); // 숫자 개수
        int x = Integer.parseInt(st.nextToken()); // 기준 숫자

        // String[] s = br.readLine().split(" ");
        StringBuilder sb = new StringBuilder();

        // Token이 역시 더 빠르다...
        StringTokenizer st1 = new StringTokenizer(br.readLine());        
        for(int i = 0; i < n; i++) {
            String tmp = st1.nextToken();
            if(x > Integer.parseInt(tmp))
                sb.append(tmp + " ");
        }
        System.out.print(sb);
    }
}
