import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 회의실배정 분류
// 시간 제한	메모리 제한	제출	정답	맞은 사람	정답 비율
// 2 초	128 MB	55142	15727	11619	28.456%
// 문제
// 한 개의 회의실이 있는데 이를 사용하고자 하는 N개의 회의에 대하여 회의실 사용표를 만들려고 한다. 각 회의 I에 대해 시작시간과 끝나는 시간이 주어져 있고, 각 회의가 겹치지 않게 하면서 회의실을 사용할 수 있는 회의의 최대 개수를 찾아보자. 단, 회의는 한번 시작하면 중간에 중단될 수 없으며 한 회의가 끝나는 것과 동시에 다음 회의가 시작될 수 있다. 회의의 시작시간과 끝나는 시간이 같을 수도 있다. 이 경우에는 시작하자마자 끝나는 것으로 생각하면 된다.

// 입력
// 첫째 줄에 회의의 수 N(1 ≤ N ≤ 100,000)이 주어진다. 둘째 줄부터 N+1 줄까지 각 회의의 정보가 주어지는데 이것은 공백을 사이에 두고 회의의 시작시간과 끝나는 시간이 주어진다. 시작 시간과 끝나는 시간은 231-1보다 작거나 같은 자연수 또는 0이다.

// 출력
// 첫째 줄에 최대 사용할 수 있는 회의의 최대 개수를 출력한다.

// 1931

public class Conference {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int numOfConf = Integer.parseInt(br.readLine()); // 회의 개수를 저장
        int isbook[] = new int[2147483647]; // 회의불가능 시간 기록 (가능 = 0, 불가능 1)
        boolean isConf = false; // 해당 시간의 회의 가능 여부 기록
        int answer = 0; // 진행한 회의 수

        for (int i = 0; i < numOfConf; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int start = Integer.parseInt(st.nextToken());
            int end = Integer.parseInt(st.nextToken());

            // 시작 시간과 끝 시간이 같은 경우
            if(isbook[start] == 0 && start == end) {
                answer += 1;
            }

            // start와 end시간에 회의 가능 여부 확인
            for (int z = start; z < end; z++) {
                if (z == end - 1 && isbook[z] == 0) isConf = true;
                if (isbook[z] == 0) continue;
                else break;
            }

            // 회의 가능 시간이면 해당 시간을 true로 바꾸기
            if (isConf == true) {
                for (int j = start; j < end; j++) 
                    isbook[j] = 1;
                answer += 1;
                isConf = false;
            }
        }
        // int n = (int)Math.pow(2,31);
        // System.out.println(n);
        System.out.println(answer);
    }
}