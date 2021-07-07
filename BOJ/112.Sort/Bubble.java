// 수 정렬하기

// 문제
// N개의 수가 주어졌을 때, 이를 오름차순으로 정렬하는 프로그램을 작성하시오.

// 입력
// 첫째 줄에 수의 개수 N(1 ≤ N ≤ 1,000)이 주어진다. 둘째 줄부터 N개의 줄에는 숫자가 주어진다. 이 수는 절댓값이 1,000보다 작거나 같은 정수이다. 수는 중복되지 않는다.

// 출력
// 첫째 줄부터 N개의 줄에 오름차순으로 정렬한 결과를 한 줄에 하나씩 출력한다.
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
// import java.util.Scanner;

public class Bubble {
    public static void main(String[] args) throws NumberFormatException, IOException {
        // Scanner s = new Scanner(System.in);
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // 입력을 n개만큼 받기
        int N = Integer.parseInt(br.readLine());
        int numArr[] = new int[N];
        
        // n개를 배열에 담기
        for(int i = 0; i < N; i++)
            numArr[i] = Integer.parseInt(br.readLine());

        // 0번 인덱스부터 순차적으로 max값을 끝에 모으기
        for(int i = 0; i < N - 1; i++) { // loop 횟수는 n - 1회
            for(int j = 1; j < N - i; j++) { // 0번 인덱스부터 max값을 제일 뒤로보낸다.
                if(numArr[j - 1] > numArr[j]) {
                    int tmp = numArr[j];
                    numArr[j] = numArr[j - 1];
                    numArr[j - 1] = tmp;
                }
            }
        }
        
        // 정렬된 배열 출력하기
        for(int i = 0; i < numArr.length; i++) {
            System.out.println(numArr[i]);
        }
    }
}
