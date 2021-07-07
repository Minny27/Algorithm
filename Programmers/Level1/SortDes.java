import java.util.Arrays;
import java.util.Collections;

class SortDes {
    public String solution(String s) {
        String [] str_split = s.split("");             // 문자열을 하나씩 분리하기
        Arrays.sort(str_split);                        // 오름차순 정렬
        Collections.reverse(Arrays.asList(str_split)); // 내림차순 정렬
        s = Arrays.toString(str_split);
        return String.join("",str_split);
    }

public static void main(String args[]) {
    SortDes sol = new SortDes();
    System.out.println(sol.solution("Zbcdefg"));
    System.out.println(sol.solution("ZbcdefgzGGH"));
}
}