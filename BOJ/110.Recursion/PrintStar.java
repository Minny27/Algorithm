// 별 찍기 - 10 분류
// 시간 제한	메모리 제한	제출	정답	맞은 사람	정답 비율
// 1 초	256 MB	20342	10382	7459	50.515%
// 문제
// 재귀적인 패턴으로 별을 찍어 보자. N이 3의 거듭제곱(3, 9, 27, ...)이라고 할 때, 크기 N의 패턴은 N×N 정사각형 모양이다.

// 크기 3의 패턴은 가운데에 공백이 있고, 가운데를 제외한 모든 칸에 별이 하나씩 있는 패턴이다.

// ***
// * *
// ***
// N이 3보다 클 경우, 크기 N의 패턴은 공백으로 채워진 가운데의 (N/3)×(N/3) 정사각형을 크기 N/3의 패턴으로 둘러싼 형태이다. 예를 들어 크기 27의 패턴은 예제 출력 1과 같다.

// 입력
// 첫째 줄에 N이 주어진다. N은 3의 거듭제곱이다. 즉 어떤 정수 k에 대해 N=3k이며, 이때 1 ≤ k < 8이다.

// 출력
// 첫째 줄부터 N번째 줄까지 별을 출력한다.
import java.util.Scanner;

public class PrintStar {
    static char[][] arr; // 별을 저장하기 위한 2차원배열
    static int input; // 입력값을 저장할 변수
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        input = scanner.nextInt();
        scanner.close();
        arr = new char[input][input]; // input x input 크기의 배열

        // 먼저 배열에 빈 칸을 입력하기
    	for (int i = 0; i < input; i++) {
    		for (int j = 0; j < input; j++) 
                arr[i][j] = ' ';
    	}
        star(0,0,input);
        StringBuilder sb = new StringBuilder();
    	for (int i = 0; i < input; i++) {	
            System.out.println(arr[i]);
            // for (int j = 0; j < input; j++)
            //     sb.append(arr[i][j]);
    		// sb.append('\n');
        }
        // System.out.print(sb);
    }
    
    // for 루프를 타는 순간 9 x 9 
	public static void star(int a,int b,int n) { 
		if(n==1) { 
			arr[a][b] = '*';
			return;
		}
		for(int i=0;i<3;i++) { 
			for(int j=0;j<3;j++) {
				if(i==1 && j ==1) 
					continue;
				star(a+(n/3*i),b+(n/3*j),n/3); 
			}
		}
		return;
	}
}
