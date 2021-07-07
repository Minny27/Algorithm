package Ref;

// 1065	
// 한수	
import java.io.*;

class FstNumRef {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());
		br.close();
		System.out.println(hannum(n));
	}

	public static int hannum(int a) {
		if(a < 100) {
			return a;
		}
		else {
			int n = 99;
			int[] nlist = new int[3]; // 먼저 배열로 생각을 했다는게 대단
			for(nlist[0] = 1 ; nlist[0] < 10 ; nlist[0]++) {
				if(a/100 < nlist[0]) break;
				for(nlist[1] = 0 ; nlist[1] < 10 ; nlist[1]++) {
					if((a/100 == nlist[0]) && (a/10)%10 < nlist[1]) break;
					nlist[2] = nlist[1]*2 - nlist[0]; // 1의 자리를 1씩 증가가 아니라 등차 만큼 증가시키는 것이 포인트
					if(nlist[2] >= 0 && nlist[2] < 10 && nlist[0]*100 + nlist[1]*10 + nlist[2] <= a) n+=1;
				}
			}
			return n;
		}
	}
}
