// 문제
// 준규가 가지고 있는 동전은 총 N종류이고, 각각의 동전을 매우 많이 가지고 있다.

// 동전을 적절히 사용해서 그 가치의 합을 K로 만들려고 한다. 이때 필요한 동전 개수의 최솟값을 구하는 프로그램을 작성하시오.

// 입력
// 첫째 줄에 N과 K가 주어진다. (1 ≤ N ≤ 10, 1 ≤ K ≤ 100,000,000)

// 둘째 줄부터 N개의 줄에 동전의 가치 Ai가 오름차순으로 주어진다. (1 ≤ Ai ≤ 1,000,000, A1 = 1, i ≥ 2인 경우에 Ai는 Ai-1의 배수)

// 출력
// 첫째 줄에 K원을 만드는데 필요한 동전 개수의 최솟값을 출력한다.

// 실제 지폐만 생각하고 문제를 풀다가 시간이 많이 걸렸다..
import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Coin {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        int numOfCoin = s.nextInt();
        int num = s.nextInt();
        int answer = 0;
        Integer coinArr[] = new Integer[numOfCoin];

        // 배열에 입력 값 넣기
        for(int i = 0; i < numOfCoin; i++) {
            coinArr[i] = s.nextInt();                  
        }
        s.close();

        // 역순 정렬
        Arrays.sort(coinArr, Collections.reverseOrder()); // Collections.reverseOrder는 int 객체일때만 사용가능
        for(int i = 0; i < coinArr.length; i++) {
            if(num / coinArr[i] >= 1) {
                answer += num / coinArr[i];
                num -= num / coinArr[i] * coinArr[i];
            }
        }
        System.out.println(answer);
    }
}
