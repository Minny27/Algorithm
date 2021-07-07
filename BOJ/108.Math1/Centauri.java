import java.io.*;
import java.util.StringTokenizer;


// 1011
// Fly me to the Alpha Centauri

public class Centauri {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        long n = Long.parseLong(br.readLine());

        // 거리를 루트한 것을 반올림했을 때, 올림한 것과 동일한 경우와 내림했을 경우와 동일한 경우를 나누어서 풀이
        for(int i = 0; i < n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            long start = Long.parseLong(st.nextToken());
            long end = Long.parseLong(st.nextToken());
            double dist = end - start;

            // 올림한 것과 같으면 (올림한 것) * 2 - 1
            if(Math.round(Math.sqrt(dist)) == Math.ceil(Math.sqrt(dist)))
                sb.append((long)Math.ceil(Math.sqrt(dist)) * 2 - 1).append("\n");

            // 내림한 것과 같으면 (내림한 것) * 2
            else
                sb.append((long)Math.floor(Math.sqrt(dist)) * 2).append("\n");
        }
        System.out.print(sb);
    }
}

/* 테스트 케이스
4
0 3
1 5
45 50
0 15

답:
3
3
4
7


확실히 알고리즘이 이해가 되지 않을 때는 공책에 하나씩 써보면서 규칙을 찾는 것이 좋은 것 같다.
*/
