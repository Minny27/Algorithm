import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// 2941	
// 크로아티아 알파벳	
public class CroatiaAlpha {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] input = br.readLine().split(""); // 입력 값을 string 배열에 넣기
        int cnt = input.length; // 결과값
        
        // 문자 당 1을 다 더해놓고 "=" or "-" or "j" 일 때 -로 처리
        for(int i = 0; i < input.length; i++) {
            // "=" 일 때
            if(input[i].equals("=")) {
                if(input[i - 1].equals("z"))
                    if(i - 2 >= 0 && input[i - 2].equals("d")) cnt -= 2; // "dz="
                    else cnt -= 1; // "z="
                if(input[i - 1].equals("c")) cnt -= 1; // "c="
                else if(input[i - 1].equals("s")) cnt -= 1; // "s="
            }

            // "-" 일 때
            else if(input[i].equals("-")) {
                if(input[i - 1].equals("c")) cnt -= 1; // "c-"
                else if(input[i - 1].equals("d")) cnt -= 1; // "d-"
            }
            
            // "j" 일 때
            else if(input[i].equals("j")) {
                if(i > 0 && input[i - 1].equals("l")) cnt -= 1; // "lj"
                else if(i > 0 && input[i - 1].equals("n")) cnt -= 1; // "nj"
                else continue;
            }
        }
        System.out.println(cnt);
    }
}

// // "-" 또는 "="이 문자와 함께나온다는 가정하에
// if(input[i].equals("-") || input[i].equals("=")) continue;
            
// // "lj" 또는 nj" 뒤에 "j" 처리
// if(input[i].equals("j") && i != 0)
//     if(input[i - 1].equals("l") || input[i - 1].equals("n")) continue;

// // "c=" or "c-" 일 때
// else if(input[i].equals("c")) {
//     if(i != input.length - 1 && input[i + 1].equals("=")) cnt++;
//     else if(i != input.length - 1 && input[i + 1].equals("-")) cnt++;
// }

// // "dz=" or "d-" 일 때
// if(input[i].equals("d")) {
//     if(i != input.length - 1 && input[i + 1].equals("z"))
//         if(i != input.length - 1 && input[i + 2].equals("="))
//             cnt++;
//     else if(i != input.length - 1 && input[i + 1] == "-") cnt++;
// }

// // "lj" 일 때
// if(input[i].equals("l")) {
//     if(i != input.length - 1 && input[i + 1].equals("j")) cnt++;
// }

// // "nj" 일 때
// if(input[i].equals("n")) {
//     if(i != input.length - 1 && input[i + 1].equals("j")) cnt++;
// }

// // "s=" 일 때
// if(input[i].equals("s")) {
//     if(i != input.length - 1 && input[i + 1].equals("=")) cnt++;
// }

// // "z=" 일 때
// if(input[i].equals("z")) {
//     if(i != input.length - 1 && input[i + 1].equals("=")) cnt++;
// }
// else cnt++;