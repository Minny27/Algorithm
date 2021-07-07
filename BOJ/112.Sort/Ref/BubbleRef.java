package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BubbleRef {

	public static void main(String[] args) throws NumberFormatException, IOException  {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int N = Integer.parseInt(br.readLine());
		
		int [] arr = new int [N];
		
		
		//StringTokenizer st = new StringTokenizer(br.readLine());
		
		for (int i = 0 ; i < N ; i ++){
			
			arr[i] = Integer.parseInt(br.readLine());
			//System.out.println(arr[i]);
		}

		Arrays.sort(arr);
					
		for( int i : arr){
			System.out.println(i);	
		}
	}
}	
		