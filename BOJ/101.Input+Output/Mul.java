import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Mul {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // System.in.read()는 아키코드 번호를 담고 있다.
        int a = System.in.read();
        System.in.read();
        int b = System.in.read();
        // String s[] = br.readLine().split(" ");
        // int a = Integer.parseInt(s[0]);
        // int b = Integer.parseInt(s[1]);
        // StringTokenizer st = new StringTokenizer(br.readLine());
        // int a = Integer.parseInt(st.nextToken());
        // int b = Integer.parseInt(st.nextToken());
        // System.out.println(a * b);
        // System.out.println(Integer.parseInt(s[0]) * Integer.parseInt(s[1]));
        System.out.println((a - 48) * (b - 48));
    }
}
