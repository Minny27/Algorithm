import java.util.*;
import java.io.*;

// 2562
// 최댓값

public class NstMax {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        
        ArrayList<Integer> list = new ArrayList<>();
        StringBuilder sb = new StringBuilder(); // 결과 값 저장
        int max = Integer.MIN_VALUE;

        // arr에 값 넣기
        for(int i = 0; i < 9; i++) { 
            list.add(Integer.parseInt(br.readLine()));
        }

        // max값 뽑기
        for(int i = 0; i < 9; i++) { 
            if(list.get(i) > max) max = list.get(i);
        }
        sb.append(max + " " + (list.indexOf(max) + 1));
        System.out.println(sb);
    }
}
