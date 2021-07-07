import java.io.*;

// 2438
// 별 찍기 - 1
public class PrintStar {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        StringBuilder sb = new StringBuilder();

        // 바깥쪽은 행의 개수, 안쪽은 행의 순서만큼 별찍기
        for(int i = 1; i <= n; i++) {
            for(int j = 0; j < i; j++) {
                sb.append("*");
            }
            sb.append("\n");
        }
        System.out.print(sb);
    }
}

