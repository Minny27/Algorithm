import java.io.*;
import java.util.*;

// 4153
// 직각삼각형

public class IsAWriteTriangle {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken());
        int b = Integer.parseInt(st.nextToken());
        int c = Integer.parseInt(st.nextToken());

        while(a != 0 && b != 0 && c != 0) {
            int tmp = a;
            a = a > b ? b : a;
            b = tmp > b ? tmp : b;

            tmp = b;
            b = b > c ? c : b;
            c = tmp > c ? tmp : c;

            if(c * c == a * a + b * b)
                sb.append("right").append("\n");
            else
                sb.append("wrong").append("\n");

            st = new StringTokenizer(br.readLine());
            a = Integer.parseInt(st.nextToken());
            b = Integer.parseInt(st.nextToken());
            c = Integer.parseInt(st.nextToken());
        }
        System.out.print(sb);
    }
}
