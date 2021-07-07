import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// 14681
public class Quadrant {
    public static void main(String[] argrs) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int a = Integer.parseInt(br.readLine());
        int b = Integer.parseInt(br.readLine());

        if(a > 0 && b > 0) System.out.println(1);
        else if(a < 0 && b > 0) System.out.println(2);
        else if(a < 0 && b < 0) System.out.println(3);
        else System.out.println(4);
    }
}
