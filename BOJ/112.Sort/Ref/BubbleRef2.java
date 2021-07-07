package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BubbleRef2 {

	public static void main(String[] args) throws NumberFormatException, IOException  {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int N = Integer.parseInt(br.readLine());
	
		boolean [] boo = new boolean[2001];
		
		StringBuilder sb = new StringBuilder();
        
        // 여기부터는 이해가 안 된다...
		for (int i = 0 ; i < N ; i ++){	
			boo[Integer.parseInt(br.readLine()) + 1000] = true;
		}

				
		for(int i = 0 ; i < 2001 ; i++){
			if(boo[i]){
				sb.append(i-1000).append("\n");	
			}
		}
		System.out.print(sb);
 
	}
}	
		