import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 1330
public class ComNum {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken());
        int b = Integer.parseInt(st.nextToken());
        // char answer = a > b ? '>' : '<'; // 삼항 연산자는 두개 밖에 표현할 수 없어서 배제
        // 가 아니라 한 줄코딩 가능..
        // System.out.println(a == b ? "==" : a > b ? ">" : "<");


        if(a > b) System.out.println('>');
        else if(a < b) System.out.println('<');
        else System.out.println("==");
    }
}