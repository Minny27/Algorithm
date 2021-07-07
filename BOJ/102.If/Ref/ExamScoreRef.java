package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ExamScoreRef {

    // switch case로도 구현 가능
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int score = Integer.parseInt(br.readLine());
		char a;
		switch(score / 10) {
		case 10:
		case 9: a = 'A'; break;
		case 8: a = 'B'; break;
		case 7: a = 'C'; break;
		case 6: a = 'D'; break;
		default: a = 'F'; break;
		}
		System.out.println(a);
	}

}
