package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class SpecialMulRef {
	public static void main(String args[]) throws NumberFormatException, IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String x = br.readLine();
		String y = br.readLine();
        
        // charAt() 함수를 활용할 수 있는 것을 염두할것. 그리고 아스키 코드 48이 0
		System.out.println(Integer.parseInt(x)* (y.charAt(2)-48));
		System.out.println(Integer.parseInt(x)* (y.charAt(1)-48));
		System.out.println(Integer.parseInt(x)* (y.charAt(0)-48));
		System.out.println(Integer.parseInt(x)*Integer.parseInt(y));

	}
}
