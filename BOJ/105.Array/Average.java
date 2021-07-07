import java.io.*;
import java.util.*;

// 1546
// 평균
public class Average {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int[] arr = new int[n];
        double max = Integer.MIN_VALUE;
        double sum = 0;
        // int score;

        StringTokenizer st = new StringTokenizer(br.readLine());

        for(int i = 0; i < n; i++ ) {
            arr[i] = Integer.parseInt(st.nextToken()); // 값 넣기
            sum += arr[i]; // 값의 합
            if(arr[i] > max) max = arr[i]; // 맥스값 찾기
        }

        // // 거짓말 한 값을 더하기
        // for(int i = 0; i < n; i++) {
        //     result += (arr[i] / max * 100);
        // }
        
        System.out.println(sum / n / max * 100);
    }
}
