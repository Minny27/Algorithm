import java.io.*;

// 2675	
// 문자열 반복	
public class RepeatString {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int line = Integer.parseInt(br.readLine());

        for(int i = 0; i < line; i++) {
            String[] s = br.readLine().split(""); // 문자 하나씩 String 배열에 넣기
            int n = Integer.parseInt(s[0]); // 반복 횟수
            for(int j = 2; j < s.length; j++) { // index 증가
                for(int z = 0; z < n; z++) // 반복
                    sb.append(s[j]);
            }
            sb.append("\n");
        }
        System.out.print(sb);
    }
}