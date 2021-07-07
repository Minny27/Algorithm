import java.util.*;
import java.io.*;

// 12852
// 1로 만들기 2

public class NToOne {
    static int[] toNMin = new int[1000001]; // 각 1 ~ n까지의 최소
    static int[] totalMin = new int[1000001]; // n에서의 최소 값들의 모음
    
    // dfs? n에서 3 -> 2 -> -1 순으로 재귀
    public static int dfs(int n) {
        // 이미 구한 n에서의 합은 넘어감
        if(toNMin[n] != -1)
            return toNMin[n];

        // n == 1 이면 최소가 0 이므로 0을 저장
        if(n == 1)
            return toNMin[n] = 0;

        int min = Integer.MAX_VALUE; // n에서의 최소값을 저장
        int out = 0; // n에서 그 다음 최소값을 저장
        int three, two, one; // 3, 2 로 나누었을 때, 그리고 1로 뺐을 때의 시행 횟수를 저장
        
        // 3으로 나누는 것을 가장 먼저 시행
        if(n % 3 == 0) {
            three = dfs(n / 3);
            if(min > three) {
                min = three;
                out = n / 3;
            }
        }
        if(n % 2 == 0) {
            two = dfs(n / 2);
            if(min > two) {
                min = two;
                out = n / 2;
            }
        }
        one = dfs(n - 1);
        if(min > one) {
            min = one;
            out = n - 1;
        }
        totalMin[n] = out;
        return toNMin[n] = ++min;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int n = Integer.parseInt(br.readLine());

        // 최소가 0이기 때문에 -1을 n까지 저장
        for(int i = 1; i <= n; i++)
            toNMin[i] = -1;
        
        int ans = dfs(n);
        sb.append(ans).append("\n").append(n + " ");

        while(totalMin[n] > 0) {
            sb.append(totalMin[n] + " ");
            n = totalMin[n];
        }
        sb.append("\n");
        System.out.print(sb);
    }
}
