


// 배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.

// 예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면

// array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.
// 1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.
// 2에서 나온 배열의 3번째 숫자는 5입니다.
// 배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.

// 제한사항
// array의 길이는 1 이상 100 이하입니다.
// array의 각 원소는 1 이상 100 이하입니다.
// commands의 길이는 1 이상 50 이하입니다.
// commands의 각 원소는 길이가 3입니다.
import java.util.ArrayList;
import java.util.Collections;

public class IndexK {
    public int[] solution(int[] array, int[][] commands) {
        int[] answer = {};
        ArrayList<Integer> list = new ArrayList<Integer>();
        ArrayList<Integer> result = new ArrayList<Integer>();

        for(int i = 0; i < commands.length; i++) {
            for(int j = commands[i][0]; j <= commands[i][1]; j++) {
                // System.out.print(commands[i][0] + " ");
                // System.out.print(commands[i][1] + " ");
                // System.out.println();
                list.add(array[j - 1]);
                // for(int u = 0; u < list.size(); u++) {
                    // System.out.print(list.get(u) + " ");
                //   }
                //   System.out.println();
            }
            Collections.sort(list);
            result.add(list.get(commands[i][2] - 1));
            list.clear();
            // System.out.print(result + " ");
            // System.out.println();
        }
        answer = new int[commands.length];
        int size = 0;
        for(int i : result){
            // System.out.print(i + " ");
            answer[size++] = i;
        }
        return answer;
    }
    public static void main(String[] args){
        IndexK ink = new IndexK();
        int[] aaa = {1, 5, 2, 6, 3, 7, 4};
        int[][] bbb = {{2, 5, 3}, {4, 4, 1}, {1, 7, 3}};
        System.out.println(ink.solution(aaa,bbb));
    }
}

/* 출력
for(int u = 0; u < list.size(); u++) {
  System.out.print(list.get(u) + " ");
}
System.out.println();
 */
