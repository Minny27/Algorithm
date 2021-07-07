import java.io.*;
import java.util.*;

// 10818
// 최소, 최대
public class MinMax {
        public static void main(String[] args) throws IOException {
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            // BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
            
            StringBuilder sb = new StringBuilder(); // 결과 값 저장
            int n = Integer.parseInt(br.readLine()); //             
            // StringTokenizer st = new StringTokenizer(br.readLine()); // 토큰
            String[] token = br.readLine().split(" ");
            // String s = br.readLine().replaceAll(" ", "");
            // int[] arr = new int[n];
            int min = Integer.parseInt(token[0]);
            int max = Integer.parseInt(token[0]);
            
            for(int i = 1; i < token.length; i++) {
                if(Integer.parseInt(token[i]) > max) max = Integer.parseInt(token[i]);
                if(Integer.parseInt(token[i]) < min) min = Integer.parseInt(token[i]);
            }
            // min
            // for(int i = 0; i < n; i++) {
            //     arr[i] = Integer.parseInt(token[i]);
            // }
            // Arrays.sort(arr);

            // // max
            // for(int i = 0; i < n - 1; i++) {
            // }
            // sb.append(min + " " + max);
            // System.out.print(arr[0] + " " + arr[n - 1]);
            System.out.print(min + " " + max);
        }
}
