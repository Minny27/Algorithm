package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class MulRef {
	public static void main(String[] args) throws IOException {
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader bf = new BufferedReader(isr);
        
        // bf.read()를 char -> int로 형변환하는 방법을 알게 되었다.
		int a = Character.getNumericValue(bf.read());
		bf.read();
        int b = Character.getNumericValue(bf.read());		
		System.out.println(a * b); 
		
	}
}
