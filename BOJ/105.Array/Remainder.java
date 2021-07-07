import java.io.*;
import java.util.*;

// 3052
// 나머지
public class Remainder {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));        
        // StringBuilder sb = new StringBuilder(); // 결과 값 저장
        ArrayList<Integer> remainderArr = new ArrayList<>();

        for(int i = 0; i < 10; i++) {
            int input = Integer.parseInt(br.readLine());
            if(!remainderArr.contains(input % 42)) remainderArr.add(input % 42);
        }
        System.out.println(remainderArr.size());
    }
}

// HashSet<Integer> remainderSet = new HashSet<>();
//         for(int i=0; i<10; i++){
//             int input = Integer.valueOf(br.readLine());
//             remainderSet.add(input%42);
//         }
