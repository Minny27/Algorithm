import java.io.*;
import java.util.StringTokenizer;

// 1085
// 직사각형에서 탈출

public class Escape {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int x = Integer.parseInt(st.nextToken());
        int y = Integer.parseInt(st.nextToken());
        int w = Integer.parseInt(st.nextToken());
        int h = Integer.parseInt(st.nextToken());
        
        int minOfZeroToPoint = Math.min(x,y); // 원점에서의 최소 거리
        int minOfRightPoint = Math.min(w - x, h - y); // 오른쪽 꼭지점에서의 최소 거리
        int answer = Math.min(minOfRightPoint, minOfZeroToPoint); 

        System.out.println(answer);
    }
}
