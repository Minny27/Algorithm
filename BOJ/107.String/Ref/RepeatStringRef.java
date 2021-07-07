package Ref;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.StringTokenizer;

// 2675	
// 문자열 반복	
public class RepeatStringRef {

	private static int T;
	private static int repeat; 
	private static char[] chArray, resultArray;
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
	
		T = Integer.parseInt(br.readLine());
		
		for(int t = 1 ; t <= T ; t++) {
			StringTokenizer st = new StringTokenizer(br.readLine());
            repeat = Integer.parseInt(st.nextToken());
			chArray = st.nextToken().toCharArray(); // 이렇게 활용하는 것도 가능하구나
			
			resultArray = new char[repeat*chArray.length];
			
			setData();
			print(bw);
		}
		bw.flush();
		bw.close();
	}
    
    // 함수를 만들어서 사용하면 재사용하기도 좋고 빠른 것을 알았다.
	private static void setData() {
		int index = 0;
		for(int i = 0 ; i < chArray.length ; i++) {
			for(int j = 0 ; j < repeat ; j++) {
				resultArray[index++] = chArray[i];
			}
		}
	}
	
	private static void print(BufferedWriter bw) throws Exception {
		for(int i = 0 ; i < resultArray.length ; i++) {
			bw.write(String.valueOf(resultArray[i]));
		}
		bw.newLine();
	}
}


