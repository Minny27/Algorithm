import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// 10430
public class Remainder {
    public static void main(String[] args) throws IOException{
        String s[] = new BufferedReader(new InputStreamReader(System.in)).readLine().split(" ");
        int a = Integer.parseInt(s[0]);
        int b = Integer.parseInt(s[1]);
        int c = Integer.parseInt(s[2]);
        System.out.println((a + b) % c);
        System.out.println(((a % c) + (b % c)) % c);
        System.out.println((a * b) % c);
        System.out.println(((a % c) * (b % c)) % c);
    }
}
