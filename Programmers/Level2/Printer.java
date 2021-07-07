// 문제 설명
// 일반적인 프린터는 인쇄 요청이 들어온 순서대로 인쇄합니다. 그렇기 때문에 중요한 문서가 나중에 인쇄될 수 있습니다. 이런 문제를 보완하기 위해 중요도가 높은 문서를 먼저 인쇄하는 프린터를 개발했습니다. 이 새롭게 개발한 프린터는 아래와 같은 방식으로 인쇄 작업을 수행합니다.

// 1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
// 2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
// 3. 그렇지 않으면 J를 인쇄합니다.
// 예를 들어, 4개의 문서(A, B, C, D)가 순서대로 인쇄 대기목록에 있고 중요도가 2 1 3 2 라면 C D A B 순으로 인쇄하게 됩니다.

// 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 알고 싶습니다. 위의 예에서 C는 1번째로, A는 3번째로 인쇄됩니다.

// 현재 대기목록에 있는 문서의 중요도가 순서대로 담긴 배열 priorities와 내가 인쇄를 요청한 문서가 현재 대기목록의 어떤 위치에 있는지를 알려주는 location이 매개변수로 주어질 때, 내가 인쇄를 요청한 문서가 몇 번째로 인쇄되는지 return 하도록 solution 함수를 작성해주세요.

// 제한사항
// 현재 대기목록에는 1개 이상 100개 이하의 문서가 있습니다.
// 인쇄 작업의 중요도는 1~9로 표현하며 숫자가 클수록 중요하다는 뜻입니다.
// location은 0 이상 (현재 대기목록에 있는 작업 수 - 1) 이하의 값을 가지며 대기목록의 가장 앞에 있으면 0, 두 번째에 있으면 1로 표현합니다.

// 해시맵을 사용하려고 했지만 value값이 동일할 때 처리가 어려워서 포기
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;

public class Printer {
    public int solution(int[] priorities, int location) {
        Deque<Integer> dq = new ArrayDeque<>(); // 배열에서 우선 순위가 가장 높은 수까지의 대기
        ArrayList<Integer> priList = new ArrayList<>();
        ArrayList<Integer> ordlist = new ArrayList<>();
        int priArr[] = new int[priorities.length];
        int max = priorities[0]; // max 변수
        int idx; // 가장 큰 값의 인덱스를 저장할 변수
        int k = 1; // 큰 값에서의 인덱스부터 또 가장 큰 값을 찾기 위한 변수
        int rank = 1; // rank
        int j = 0;

        for(int i = 0; i < priorities.length; i++) {
            priList.add(priorities[i]);
        }
        for(int z = 0; z < priorities.length; z++) {
            for(int i = k; k < priList.size(); k++) {
                max = Math.max(priList.get(i), max);
            }
            idx = priList.indexOf(max);
            priArr[idx] = rank;
            priorities[idx] = 0;
            max = 0;
            k = idx + 1;
            while(priorities[j] != 0) {
                dq.add(priorities[j]);
                j++;
            }
            j++; // 0 다음 인덱스로 가기

            if(!dq.isEmpty() && k == priorities.length) {
                for(int i = 0; i < dq.size(); i++) {
                    max = Math.max(priList.get(i), max);
                }
                idx = dq.
            }
        }
        return priArr[location];
    }
    public static void main(String[] args) {
        Printer p = new Printer();
        System.out.println(p.solution(new int[] { 2, 1, 3, 2 }, 2));
        // System.out.println(p.solution(new int[] { 1, 1, 9, 1, 1, 1 }, 0));
        // System.out.println(p.solution(new int[] { 8, 2, 8, 1, 9, 3, 8, 2 }, 2));
    }
}

// ArrayList<Integer> deslist = new ArrayList<>(); // 중복을 제외한 우선순위가 높은 수를 저장하는
// list
// ArrayList<Integer> prilist = new ArrayList<>(); // 원소의 index를 추출하기 위한 list
// // ArrayList<Integer> rmvlist = new ArrayList<>(); // 이는 반복 횟수를 위해서 prilist에서
// 삭제하는 list
// ArrayList<Integer> reslist = new ArrayList<>(); // 출력 인덱스를 저장하는 list

// // 우선순위 원소 prilist에 넣기
// for(int i = 0; i < priorities.length; i++) {
// prilist.add(priorities[i]);
// if(!deslist.contains(priorities[i])) deslist.add(priorities[i]);
// }

// Collections.reverse(deslist); // 역순 정렬
// int k = 0;
// // deslist에서 가장 큰 수를 찾아 priorities 배열에 0을 채우고 그 인덱스를 기준으로 다시 큰 수를 찾고를 반복
// for(int i = 0; i < deslist.size(); i++) {
// for(int j = k; j < prilist.size(); j++) {
// if(deslist.get(i) == prilist.get(j)) {
// reslist.add(deslist.indexOf(deslist.get(i)));
// priorities[i] = 0;
// k = i;
// }
// }
// }

// deslist : 9 8 3 2 1
// prilist : 8 2 8 1 9 3 8 2

// 1st : 9 3 8 2
// 2st : 3 8 2
// 3st : 3 2
// 4st : 3
// 5st : 8 2 8 1

// deslist : 3 2 1
// prilist : 2 1 3 2
// priorities 2 1 3 2

// 1st : 2 1 0 2
// 2st : 2 1 0 0
// 3st : 0 1 0 0
// 4st : 0 0 0 0

// deque 8 2 8 1 3