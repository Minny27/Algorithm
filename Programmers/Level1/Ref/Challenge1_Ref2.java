// 2020.09.16
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class Challenge1_Ref2 {
    public int[] solution(int[] numbers) {
        Set<Integer> sumNumber = new TreeSet();

        for(int i = 0; i < numbers.length-1; i++){
            for(int j = i+1; j < numbers.length; j++){
                sumNumber.add(numbers[i] + numbers[j]);
            }
        }

        int[] answer = new int[sumNumber.size()];
        int index = 0;
        // Set의 원소를 꺼내기 위해서는 Iterator를 사용해야 함.
        Iterator itor = sumNumber.iterator();
        while(itor.hasNext()){
            answer[index] = (int)itor.next();
            index++;
        }

        return answer;
    }
}
