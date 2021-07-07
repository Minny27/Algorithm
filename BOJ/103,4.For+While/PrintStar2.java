import java.io.*;

// 2439
// 별 찍기 - 2
public class PrintStar2 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        StringBuilder sb = new StringBuilder();
        // String s = new String();

        for(int i = 1; i <= n; i++) {
            // setLength 함수는 Null값으로 초기화하기 때문에 틀린값이 나왔다...
            // sbSrc.setLength(n - 1); // setLength를 이용해서 크기만큼 빈칸으로 초기화시키기
            for(int k = n - i; k >= 1; k--)
                // s += " ";
                sb.append(" ");

            for(int j = 0; j < i; j++)
                // s += "*";
                sb.append("*");
            // s += "\n";
            sb.append("\n");
        }
        System.out.print(sb);
    }
}