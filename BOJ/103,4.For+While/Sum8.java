import java.io.*;
import java.util.*;

// 10951
// A+B - 4
public class Sum8 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        String line = br.readLine();
        int a = line.charAt(0) - '0';
        int b = line.charAt(2) - '0';
        
        while(true) {
            bw.write(a + b + "\n");
            line = br.readLine();

            if(line == null || line.equals("")) // line.length() == 0 도 가능
                break;

            a = line.charAt(0) - '0';
            b = line.charAt(2) - '0';
        }
        bw.flush();
        bw.close();
        br.close();
    }
}
