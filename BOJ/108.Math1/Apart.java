import java.io.*;

// 2775
// 부녀회장이 될테야

public class Apart {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int n = Integer.parseInt(br.readLine());
        

        // 구하고자하는 행 열의 (호 - 1) 과 (층 - 1)을 더하는 방식의 알고리즘
        for(int i = 0; i < n; i++) {
            int f = Integer.parseInt(br.readLine()); // 층수
            int r = Integer.parseInt(br.readLine()); // 호수
            
            // 아파트의 층은 0층부터이기에 1을 더하고 호수는 그대로
            int apart[][] = new int[f + 1][r];

            // 각 층의 1호는 항상 1명이므로 1로 채우기
            for(int j = 0; j < f + 1; j++) {
                apart[j][0] = 1;
            }

            // 0층의 인원은 호 수만큼 인원을 입력
            for(int j = 1; j < r; j++) {
                apart[0][j] = j + 1;
            }

            // 1층 2호부터는 (호 - 1) 과 (층 - 1)을 더해준다.
            for(int j = 1; j < f + 1; j++) {
                for(int k = 1; k < r; k++) {
                    apart[j][k] = apart[j][k - 1] + apart[j - 1][k];
                }
            }
            sb.append(apart[f][r-1]).append("\n");
        }
        System.out.print(sb);
    }
}
