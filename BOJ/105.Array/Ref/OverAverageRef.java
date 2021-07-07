package Ref;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.StringTokenizer;

// 4344
// 평균은 넘겠지
public class OverAverageRef {
	
	//4344 평균은 넘겠지
	public static void main(String[] args) {
		try {
			BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
			int count = Integer.parseInt(bf.readLine());
			
			// 외부 for문 
			for (int i=1; i<=count; i++) {
				StringTokenizer st = new StringTokenizer(bf.readLine());
				int innerCount = Integer.parseInt(st.nextToken());
				int[] group = new int[innerCount];
				int sum = 0;
				// 내부 for문
				for (int j=0; j<innerCount; j++) {
					group[j] = Integer.parseInt(st.nextToken());
					sum += group[j];
					}
                int avg = sum/innerCount;
                System.out.println(avg);
				int check = 0;
				for (int k : group) {
					if(Integer.compare(k, avg) > 0) { // 새로운 표현을 배웠다.
						check += 1;
					}
				} // 내부 for문 end
				bw.write(String.format("%.3f", check*100.000/innerCount)+"%\n");	 // %를 \n과 같이쓰면 바로 출력되는 것을 배웠다.
			} // 외부 for문 end
			bw.flush();
			bw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
