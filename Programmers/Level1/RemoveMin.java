// 제일 작은 수 제거하기
// 문제 설명
// 정수를 저장한 배열, arr 에서 가장 작은 수를 제거한 배열을 리턴하는 함수, solution을 완성해주세요. 단, 리턴하려는 배열이 빈 배열인 경우엔 배열에 -1을 채워 리턴하세요. 예를들어 arr이 [4,3,2,1]인 경우는 [4,3,2]를 리턴 하고, [10]면 [-1]을 리턴 합니다.

// 제한 조건
// arr은 길이 1 이상인 배열입니다.
// 인덱스 i, j에 대해 i ≠ j이면 arr[i] ≠ arr[j] 입니다.

import java.util.ArrayList;

public class RemoveMin {
    public int[] solution(int[] arr) {
        if(arr.length <= 1) return new int[] {-1};
        ArrayList<Integer> list = new ArrayList<Integer>();
        for(int j : arr) {
            list.add(j);
        }

        int min = arr[0];
        for(int i = 1; i < arr.length; i++) {
            if(min > arr[i])
                min = arr[i];
        }
        list.remove((list.indexOf(min)));
        int[] answer = new int[list.size()];

        for(int k = 0; k < list.size(); k++) {
            answer[k] = list.get(k);
            System.out.print(answer[k] + " ");
        }
        return answer;
    }
    public static void main(String [] args){
        RemoveMin rm = new RemoveMin();
        System.out.println(rm.solution(new int [] {4,3,2,1}));
        System.out.println(rm.solution(new int [] {10}));
    }
}