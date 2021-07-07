import java.util.*;
import java.io.*;

// 15552
public class FastSum {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine()); // n개의 줄
        StringBuilder sb = new StringBuilder();

        for(int i = 0; i < n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine()); 
            // String s[] = br.readLine().split(" ");
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());
            sb.append(a + b + "\n");
            // int a = Integer.parseInt(s[0]);
            // int b = Integer.parseInt(s[1]);
            // bw.write(a + b + " \n");
        }
        System.out.print(sb);
        // bw.flush();
        // bw.close();
    }
}
