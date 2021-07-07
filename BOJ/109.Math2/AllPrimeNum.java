import java.util.*;
import java.io.*;

// 1929
// 소수 구하기

public class AllPrimeNum {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st = new StringTokenizer(br.readLine());

        int m = Integer.parseInt(st.nextToken());
        int n = Integer.parseInt(st.nextToken());
        boolean flag = true;

        // 1 또는 2가 아닌 짝수는 pass 나머지는 sqrt까지 나누어서 떨어지면 false
        for(; m <= n; m++) {
            if(m != 2 && (m == 1 || m % 2 == 0)) continue;
            for(int i = 3;  i <= Math.sqrt(m); i += 2) {
                if(m % i == 0) flag = false;
            }
            if(flag == true)
                sb.append(m).append("\n");
            flag = true;
        }
        System.out.print(sb);
    }
}

// 왜 오래걸리는지는... 소수 문제는 에라토스테네스의 체를 이용할 것....