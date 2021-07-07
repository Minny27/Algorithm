import java.io.*;
import java.util.*;

// 1110
// 더하기 사이클
public class SumCycle {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        String line = br.readLine();
        String result = line; // 최초의 값 저장
        int n = 0; // 총 횟수

        // 입력 값이 0이면 1출력
        if(line.equals("0")) {
            System.out.println(1);
            return;
        }

        // 입력 값이 10미만의 값이면 0 추가
        if(line.length() == 1) {
            line += "0";
            result += "0";
        }

        // do-while문으로 몫과 나머지로 구할 수도 있다.
        // do {
        //             result = ((result % 10) * 10) + (((result / 10) + (result % 10)) % 10);
        //             count++;
        // } while (number != result);
        
        while(true) {
            String tmp = String.valueOf((Integer.parseInt(line.substring(0, 1)) + Integer.parseInt(line.substring(1, 2))));
            String sub = line.substring(1,2);
            line = sub; 
            if(Integer.parseInt(tmp) >= 10)
                line += tmp.substring(1,2);
            else line += tmp;
            n++;
            if(result.equals(line)) {
                System.out.println(n);
                break;
            }
        }
    }
}

// 참조
// import java.io.*;
// import java.util.*;

// public class Main {
//     public static void main(String[] args) throws IOException {
//         BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//         int number = Integer.parseInt(br.readLine());
//         int count = 0;
//         int result = number;
//         do {
//             result = ((result % 10) * 10) + (((result / 10) + (result % 10)) % 10);
//             count++;
//         } while (number != result);

//         System.out.println(count);
//     }
// }