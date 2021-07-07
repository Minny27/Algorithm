import java.io.*;

// 1065	
// 한수	
// 1000까지구나...
public class FstNum {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());

        int ans = fstnum(n);

        System.out.println(ans);
    }

    static public int fstnum(int n) {
        int ans;
        int a, b, c, d; // 각 자리 수
        int tmp; // 2번째 자리 수를 위한 변수

        // 2자리까지
        if(n <= 99) return n;

        // 110까지
        else if(n <= 110) return 99;

        // 3자리까지
        else if (n < 1000) {
            ans = 99;
            for(int i = 111; i <= n; i++) {
                
                a = i / 100;
                tmp = i / 10;
                b = tmp % 10;
                c = i % 10;
                if(a - b == b - c) ans++;
            }
        }

        // 4자리까지
        else {
            ans = 144;
            for(int i = 1000; i <= n; i++) {
                a = i / 1000;
                tmp = i / 100;
                b = tmp % 10;
                tmp = i / 10;
                c = tmp % 10;
                d = i % 10;
                if(a - b == b - c && b - c == c - d) ans++;
            }
        }
        return ans;
    }
}
