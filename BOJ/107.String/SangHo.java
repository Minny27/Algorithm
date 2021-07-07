import java.io.*;
import java.util.StringTokenizer;

// 2908	
// 상수	
public class SangHo {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int n1 = Integer.parseInt(st.nextToken());
        int n2 = Integer.parseInt(st.nextToken());

        // 세자리 거꾸로
        int tmp1 = (n1 % 10) * 100 + ((n1 / 10) % 10) * 10 + n1 / 100;
        int tmp2 = (n2 % 10) * 100 + ((n2 / 10) % 10) * 10 + n2 / 100;

        // 두수 비교
        int ans = Math.max(tmp1, tmp2);
        System.out.println(ans);
    }
}