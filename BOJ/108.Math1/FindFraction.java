import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// 1193
// 분수찾기
public class FindFraction {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine()); // 입력 값 저장
        int sq = 0; // 군
        int sumOfSq = 0; // 해당 군까지의 합
        int nstSq; // 해당 군에서 몇 번째?
        while(sumOfSq < n) {
            sumOfSq = (sq + 1) * (sq + 2) / 2; // n이 포함된 군의 합
            sq++;
        }

        // 군이 짝수일 때
        if(sq % 2 == 0) {
            nstSq = sumOfSq - n + 1; // n의 해당 군에서 번째수
            System.out.println((sq - (nstSq - 1)) + "/" + nstSq);
        }

        // 군이 짝수일 때
        else {
            nstSq = n - (sq - 1) * sq / 2;
            System.out.println((sq - (nstSq - 1)) + "/" + nstSq);
        }
    }
}

/*
테이스 케이스
2
답 : 2/1

10000000
답 : 2844/1629
 */

 // 문제를 잘 못 이해하지말자.......