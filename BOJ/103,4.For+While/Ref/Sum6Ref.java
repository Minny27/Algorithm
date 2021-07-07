package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Sum6Ref {

	public static void main(String[] args) throws IOException{
		int a, b;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		int n = Integer.parseInt(br.readLine());
		
		for(int i=1; i<=n; i++) {
			String str = br.readLine();
			a = str.charAt(0)-'0';
			b = str.charAt(2)-'0';

			sb.append("Case #").append(i).append(": ").append(a)
			.append(" + ").append(b).append(" = ").append(a+b).append("\n");

		}
		
		System.out.print(sb);
		br.close();
	
	}
}
