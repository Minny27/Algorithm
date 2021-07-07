import java.io.*;

// 11021
// A+B - 7
public class Sum5 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine()); // n개의 줄
        // StringBuilder sb = new StringBuilder();
        int result; // int 변수에 substring한 값을 넣어주어야 한다.
        
        for(int i = 1; i <= n; i++) {
            String line = br.readLine();
            int split = line.indexOf(" ");
            result = Integer.parseInt(line.substring(0, split)) + Integer.parseInt(line.substring(split + 1, line.length()));
            // sb.append("Case #" + i + ": " + result + "\n");
            bw.write("Case #" + i + ": " + result + "\n");
        }
        bw.flush();
        bw.close();
        br.close();
        // System.out.print(sb);
    }
}
