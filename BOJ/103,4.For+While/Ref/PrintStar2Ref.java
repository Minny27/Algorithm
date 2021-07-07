package Ref;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class PrintStar2Ref {

    // char 배열에 빈칸을 다 넣고 하나씩 별을 찍으면서 sb에 넣는 방식 ㅇㅈㅇㅈ
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int num = Integer.parseInt(br.readLine());
		char[] stars = new char[num];
		StringBuffer res = new StringBuffer();
		 for (int i = 0; i < num; i++) {
			stars[i] = ' ';
		}
		for (int i = 0; i < num; i++) {
			stars[num - i - 1] = '*';
			res.append(stars).append('\n');
		}
		bw.write(res.toString());
		bw.flush();
		bw.close();
		br.close();
	}
}
