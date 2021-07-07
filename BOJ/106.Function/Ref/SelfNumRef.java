package Ref;

// 4673
// 셀프 넘버	
public class SelfNumRef {

	public static void main(String[] args) {
		
		boolean[] check = new boolean[10000];
		
		for(int j=1;j<=10000;j++) {
			int n=d(j);
			if(n<=10000)
				check[n-1]=true;
		}
		
		StringBuilder buf = new StringBuilder();
		for(int i=0;i<10000;i++) {
			if(!check[i]) // 생성자가 없으면
				buf.append(i+1).append("\n");
		}
		System.out.println(buf.toString());
	}
    
    // 함수를 만들어서 while문으로 처리는 방법 굳굳
	static int d(int n) {
		int sum = n;
		while(n!=0) {
			sum+=n%10;
			n/=10;
		}
		return sum;
	}
	
}