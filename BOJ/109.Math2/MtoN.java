import java.util.*;
import java.io.*;

// 2581	
// 소수

public class MtoN {  
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int m = Integer.parseInt(br.readLine());
        int n = Integer.parseInt(br.readLine());
        int sum = 0;
        int min = 0;
        int flag = 0;
        
        // for문을 통해서 i = 1 또는 짝수는 넘어가고 나머지는 홀수를 나눠가면서 소수판정
        // 그리고 sum이 0이 아니면서 flag가 0이면 첫 소수를 min에 저장하도록 설계
        for(int i = m; i <= n; i++) {
            int cd = 0; // common divisor
            if(i == 2) {
                sum += 2;
                min = 2;
                flag++;
                continue;
            }
            else if(i == 1 || i % 2 == 0) continue;

            for(int j = 3; j <= Math.ceil(Math.sqrt(i)); j += 2) {
                if(i % j == 0) {
                    cd++;
                    break;
                }
            }
            if(cd == 0) sum += i;
            if(sum != 0 && flag == 0) {
                min = i;
                flag++;
            }
        }
        
        // m과 n사이에 소수가 없을 때 예외처리
        if(sum != 0) {
            sb.append(sum).append("\n");
            sb.append(min).append("\n");
        }
        else sb.append(-1).append("\n");

        System.out.print(sb);
    }
}

// min에 MAX_VALUE를 넣고 sum의 처음 값과 min을 하면 무조건 맨 처음 값이 유지되는 것으로 처리했어도 됐다..