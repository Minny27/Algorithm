import java.io.*;

// 11720	
// 숫자의 합	
public class SumOfNum {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        String[] s = br.readLine().split(""); // 문자 하나씩 String 배열에 넣기
        int sum = 0; // 합
        
        for(int i = 0; i < n; i++) 
            sum += Integer.parseInt(s[i]);
        System.out.println(sum);
    }
}
