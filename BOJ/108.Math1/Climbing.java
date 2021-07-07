import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// 2869
// 달팽이는 올라가고 싶다
public class Climbing {
    public static void main(String[] args) throws IOException{
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        String input[] = bf.readLine().split(" ");
        double a = Double.parseDouble(input[0]); // 오르기
        double b = Double.parseDouble(input[1]); // 내리기
        double v = Double.parseDouble(input[2]); // 정상

        // 마지막 전날에 낮에 올라갔을 때 정상을 갈 수 있는지를 판별하기 위해서 v - a를 한 값에 a - b 나누고 +1
        System.out.println((int)Math.ceil((v - a) / (a - b) + 1));
    }
}
