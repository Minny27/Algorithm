import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// 11654	
// 아스키 코드	
public class ASCIICode {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // 문자 하나만 받을 때는 System.in.read() 를 이용하는 것이 더 빠르다
        // int askit = System.in.read();
        int asciiNum = br.readLine().charAt(0);
        System.out.println(asciiNum);  
    }
}
