import java.io.*;

// 2742
// 기찍 N
public class PrintNReverse {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine()); // n개의 줄
        StringBuilder sb = new StringBuilder();
        
        // 한 번씩 찍을 떄는 StringBuilder가 나은듯하다.
        for(int i = n; i >= 1; i--) {
            // bw.write(i + "\n");
            sb.append(i + "\n");
        }
        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
        System.out.print(sb);
    }
}

