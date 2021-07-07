import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 10250
// ACM 호텔
public class ACMHotel {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();  // 결과값 저장
        int n = Integer.parseInt(br.readLine()); // 테스트할 갯수

        for(int i = 0; i < n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int height = Integer.parseInt(st.nextToken()); // 높이
            int width = Integer.parseInt(st.nextToken());  // 너비
            int nstRoom = Integer.parseInt(st.nextToken());  // n번째 방
        
            // n번째 방을 height으로 나눈 몫이 10보다 작으면 호수 가운데에 '0'을 넣고 나머지는 그대로
            if(nstRoom / height < 10)
                // nstRoom을 height으로 나눴을 때 0이 나올 수 있으므로 나누어 떨어지면 가장 높은 층
                if(nstRoom % height == 0)
                    sb.append(height + "0" +  nstRoom / height).append("\n");
                
                // 10호가 나오는 층에서는 '0' 을 제거한다.
                else if(width >= 10 && nstRoom / height == 9)
                    sb.append(nstRoom % height + "" + ((nstRoom / height) + 1)).append("\n");

                else sb.append(nstRoom % height + "0" +  ((nstRoom / height) + 1)).append("\n");
            else
                if(nstRoom % height == 0)
                    sb.append(height + "" +  nstRoom / height).append("\n");
                    
                else sb.append(nstRoom % height + "" +  ((nstRoom / height) + 1)).append("\n");
        }
        System.out.println(sb);
    }
}

/* 
테스트 케이스
10
6 12 10
6 12 72
30 50 72
1 1  1
2 10 2
2 10 4
2 10 20
1 99 21
2 1 2
1 11 11

답
402
612
1203
101
201
202
210
121
201
111

반례
10 10 99

답 910
*/