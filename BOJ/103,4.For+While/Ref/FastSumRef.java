package Ref;

import java.io.*;
// import java.util.*;

public class FastSumRef {
    public static void main(String arg[])throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine());
        int result = 0;
        // StringBuilder sb = new StringBuilder();
        
        // substring이 토큰보다 더 빠르다는 것을 알았다.
        for(int i = 0 ; i < n ; i++){
            String line = br.readLine();
            int split = line.indexOf(" ");
            // sb.append(Integer.parseInt(line.substring(0, split)) + Integer.parseInt(line.substring(split + 1, line.length())) + "\n");
            result = Integer.parseInt(line.substring(0, split)) + Integer.parseInt(line.substring(split + 1, line.length()));
            bw.write(result + "\n");

        }
        // bw.write(sb.toString());
        // System.out.print(sb);
        bw.flush();
        br.close();
        bw.close();
    }
}
