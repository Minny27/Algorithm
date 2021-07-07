import java.util.Arrays;
import java.util.Collections;

public class DescNum {
    public long solution(long n) {
        String answer = new String();
        String str_n [] = String.valueOf(n).split("");
        Arrays.sort(str_n, Collections.reverseOrder());
        for(String str : str_n) {
            answer = answer.concat(str);
        }
        return Long.valueOf(answer);
    }
    public static void main(String[] args){
        DescNum dn = new DescNum();
        System.out.println(dn.solution(118372));
    }    
}