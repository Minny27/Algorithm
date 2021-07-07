package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class SubRef3 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine();
        // s.split(" ")가 String 배열이 되므로 0 1번째 인덱스로 활용할 수 있다.
        int a = Integer.parseInt(s.split(" ")[0]);
        int b = Integer.parseInt(s.split(" ")[1]);
        System.out.println(a-b);
    }
}
