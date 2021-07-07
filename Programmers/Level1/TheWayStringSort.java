
// 문자열 내 마음대로 정렬하기
// 문제 설명
// 문자열로 구성된 리스트 strings와, 정수 n이 주어졌을 때, 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬하려 합니다. 예를 들어 strings가 [sun, bed, car]이고 n이 1이면 각 단어의 인덱스 1의 문자 u, e, a로 strings를 정렬합니다.

// 제한 조건
// strings는 길이 1 이상, 50이하인 배열입니다.
// strings의 원소는 소문자 알파벳으로 이루어져 있습니다.
// strings의 원소는 길이 1 이상, 100이하인 문자열입니다.
// 모든 strings의 원소의 길이는 n보다 큽니다.
// 인덱스 1의 문자가 같은 문자열이 여럿 일 경우, 사전순으로 앞선 문자열이 앞쪽에 위치합니다.
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class TheWayStringSort {
    public String[] solution(String[] strings, int n) {
        String[] answer = new String[strings.length];
        ArrayList<Character> nst = new ArrayList<Character>();
        ArrayList<String> nst_str = new ArrayList<String>();

        Arrays.sort(strings);

        for (int i = 0; i < strings.length; i++) {
            char strings_char[] = strings[i].toCharArray();
            if (!nst.contains(strings_char[n])) {
                nst.add(strings_char[n]);
            }
        }

        Collections.sort(nst);

        for (int i = 0; i < nst.size(); i++) {
            for (int j = 0; j < strings.length; j++) {
                if (nst.get(i) == strings[j].charAt(n)) {
                    nst_str.add(strings[j]);
                } else {
                    continue;
                }
            }
        }
        for (int y = 0; y < answer.length; y++) {
            answer[y] = nst_str.get(y);
            System.out.print(answer[y] + " ");
        }
        System.out.println();

        return answer;
    }

    public static void main(String[] args) {
        TheWayStringSort twss = new TheWayStringSort();
        System.out.println(twss.solution(new String[] { "sun", "bed", "car" }, 1));
        System.out.println(twss.solution(new String[] { "abce", "abcd", "cdx" }, 2));
        System.out.println(twss.solution(new String[] { "dbce", "gbcd", "adx" }, 2));
        System.out.println(twss.solution(new String[] { "aaaaa", "aaa", "adx" }, 2));

    }
}