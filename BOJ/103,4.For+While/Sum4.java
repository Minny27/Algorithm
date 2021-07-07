import java.io.*;

// 8393
public class Sum4 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int n = Integer.parseInt(br.readLine());
        bw.write(n * (n + 1) / 2 + "\n");
        bw.flush();
        bw.close();
    }
}
