import java.io.*;
import java.util.*;

// 4344
// 평균은 넘겠지
public class OverAverage {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        int numOfLine = Integer.parseInt(br.readLine());
        double[] overAvg = new double[numOfLine]; // 줄 별 평균 이상


        for(int i = 0; i < numOfLine; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int n = Integer.parseInt(st.nextToken()); // 줄 당 숫자 갯수
            int[] arr = new int[n]; // 비교를 위한 배열
            double avg = 0; 
            int sum = 0;
            int num = 0;

            for(int j = 0; j < n; j++ ) {
                arr[j] = Integer.parseInt(st.nextToken());
                sum += arr[j];
            }
            avg = (double)sum / (double)n;
            sum = 0;
            for(int j = 0; j < n; j++)
                if(arr[j] > avg)
                    num++;
            overAvg[i] = ((double)num / (double)n) * 100;
            // String s = String.format("%0.3f", avg);
            // sb.insert(0, Math.round(avg * (Double)100000.0) / (Double)1000.0 + "\n");
            // sb.append(Math.round(avg * 100000.0) / 1000.0 + "\n");

            // 도저히 40.0 을 40.000으로 만들어지지 않아서 System.out.print로 진행
            // 한 줄씩 찍으면 입력-출력 방식으로 일관되게 출력x
            // System.out.printf(String.format("%.3f", avg) + "\n");
        }
        // %까지 찍는 건 몰랐네...ㅠㅠㅠㅠ
        for(int i = 0; i < numOfLine; i++) 
            System.out.printf(String.format("%.3f", overAvg[i]) + "%%" + "\n");
    }   
}
