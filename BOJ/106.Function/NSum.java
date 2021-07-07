import java.io.*;
import java.util.*;

// 15596	
// 정수 N개의 합	
public class NSum {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        StringTokenizer st = new StringTokenizer(br.readLine());
        int[] arr = new int[n];

        for(int i = 0; i < n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }
        long sum = sum(arr);
        System.out.println(sum);
    }

    static public long sum(int[] a) {
        long sum = 0;
        for(int i = 0; i < a.length; i++)
            sum += a[i];
        return sum;
    }

}
