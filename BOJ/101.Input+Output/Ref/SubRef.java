package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class SubRef {
	public static void main(String[] args) throws IOException 
	{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // br.readLine().split(" ") 함수를 이용해서 구현하는 것이 더 빠른 것을 발견했다.
		String[] tempStr = br.readLine().split(" ");
		
		System.out.println(Integer.parseInt(tempStr[0]) - Integer.parseInt(tempStr[1]));	
	}
}
