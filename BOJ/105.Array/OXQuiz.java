import java.io.*;

// 8958
// OX퀴즈
public class OXQuiz {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        StringBuilder sb = new StringBuilder(); // 결과 값 저장
        boolean isO = false; // 이전 값이 O 인지 판별
        // int count = 0; // O의 갯수
        // int sum = 0; // 합

        for(int i = 0; i < n; i++) {
            String s = br.readLine();
            int count = 0;
            int sum = 0;

            for(int j = 0; j < s.length(); j++) {
                // O 일 때
                if(s.substring(j, j + 1).equals("O")) {
                    isO = true;
                    count++;
                    sum += count;
                }
                // X 일 때
                else {
                    if(isO) {
                        count = 0;
                        isO = false;
                    }
                }
            }
            sb.append(sum + "\n");
        }
        System.out.print(sb);
    }

}
