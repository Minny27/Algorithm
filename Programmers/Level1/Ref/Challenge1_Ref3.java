// 2020.09.16
import java.util.HashSet;
import java.util.Set;

public class Challenge1_Ref3 {
    public int[] solution(int[] numbers) {
        Set<Integer> set = new HashSet<>();

        for(int i=0; i<numbers.length; i++) {
            for(int j=i+1; j<numbers.length; j++) {
                set.add(numbers[i] + numbers[j]);
            }
        }

        // 스트림을 이용해서 정렬과 set을 int형 배열로 변환
        return set.stream().sorted().mapToInt(Integer::intValue).toArray();
    }
}
