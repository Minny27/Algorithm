package Ref;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 2884
public class AlramRef {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		StringTokenizer st = new StringTokenizer(br.readLine());

		int h = Integer.parseInt(st.nextToken());
		int m = Integer.parseInt(st.nextToken());

		// if 한 번으로도 가능한 것을 배움.
		int time = h * 60 + m;
		time -= 45;
		if (time < 0) {
			int lastday = 24 * 60;
			time = lastday - Math.abs(time);
		}
		System.out.println(time / 60 + " " + time % 60);
	}
}

