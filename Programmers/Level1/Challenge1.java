// 두 개 뽑아서 더하기
// 문제 설명
// [프로그래머스 문제 제작자 채용공고 보러 가기]

// 정수 배열 numbers가 주어집니다. numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.

// 제한사항
// numbers의 길이는 2 이상 100 이하입니다.
// numbers의 모든 수는 0 이상 100 이하입니다.
import java.util.*;

public class Challenge1 {
    public int[] solution(int[] numbers) {
        int sum = 0;
        // 더한 값의 중복 제거를 위한 list
        ArrayList<Integer> list = new ArrayList<Integer>();

        // 배열 각 자리의 수 더하기 알고리즘
        for(int i = 0; i < numbers.length - 1; i++) {
            for(int j = i + 1; j < numbers.length; j++) {
                sum = numbers[i] + numbers[j];
                if(!list.contains(sum)) {
                    list.add(sum);
                }
                sum = 0;
            }
        }

        // list 오름차순 정렬
        Collections.sort(list);
        int[] answer = new int[list.size()];
        for(int i = 0; i < list.size(); i++) {
            answer[i] = list.get(i);
        }
        return answer;
    }
}
