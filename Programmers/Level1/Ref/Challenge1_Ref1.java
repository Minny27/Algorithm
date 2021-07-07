// 2020.09.16
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;

public class Challenge1_Ref1 {
    public static ArrayList<Integer> solution(int[] numbers) {
        ArrayList<Integer> answer = new ArrayList<>();
        HashSet<Integer> set = new HashSet<>(); // set은 값의 중복을 허용하지 않는다.

        for (int i = 0; i < numbers.length - 1; i++) {
            for (int j = i + 1; j < numbers.length; j++) {
                set.add(numbers[i] + numbers[j]);
            }
        }
        
        // Iterator를 이용해서 set의 값을 꺼내오는 작업
        Iterator<Integer> iter = set.iterator();
        while(iter.hasNext()) {
            answer.add(iter.next());
        }

        Collections.sort(answer);
        return answer;
    }
}
