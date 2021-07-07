import java.io.*;
import java.util.StringTokenizer;

// 1152	
// 단어의 개수	
public class NumOfWord {
    public static void main(String[] args) throws IOException{
        int cnt = 0;
        int post = ' '; // 첫 ' '를 거르기 위한 변수
        while(true) {
            int c = System.in.read();
            if (c == '\n') { 
                if(post != ' ') cnt++;
                break;
            }
            else if(c == ' ')
                if(post != ' ') cnt++;
            post = c;
        }
        System.out.println(cnt);
    }
}

// 이전 풀이 -> 오래걸림
    //     BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    //     StringTokenizer st = new StringTokenizer(br.readLine());
    //     int count = 0; // 단어의 개수

    //     while(st.hasMoreTokens()) {
    //         st.nextToken();
    //         count++;
    //     }
    //     System.out.println(count);