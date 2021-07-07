package Ref;

// 1065	
// 한수	
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class FstNumRef2 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());
		int count = 0;
		if(n>99){
			for(int i = 100; i<=n; i++){
				if( ((i/100) - ((i/10)%10))==(( (i/10)%10)-(i%10)) ){
					count++;
				}
			}
			System.out.println(count+99);
		}
		else{
			System.out.println(n);
		}
	}
}