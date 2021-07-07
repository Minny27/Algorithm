import java.util.*;
import java.io.*;

// 1978
// 소수 찾기

public class NumOfPN {  
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        StringTokenizer st = new StringTokenizer(br.readLine());
        int cnt = 0;

        // 1, 2의 배수 배제, k / 2 의 올림만큼만 값을 나눴을 때 나누어 떨어지는 값이 있으면 소수가 아님
        for(int i = 0; i < n; i++) {
            int k = Integer.parseInt(st.nextToken());
            int cd = 0; // common divisor

            if(k == 2) {
                cnt++;
                continue;
            }
            else if(k == 1 || k % 2 == 0) continue;

            for(int j = 3; j < Math.ceil(k / 2); j += 2) {
                if(k % j == 0) {
                    cd++;
                    break;
                }
            }
            if(cd == 0) cnt++;
        }
        System.out.println(cnt);
    }
}

// Math.sqrt(k) 까지 나누어보는게 떠 빠를 수 있겠음.