package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class BubbleRef3 {
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in)); //선언
		StringBuilder sb = new StringBuilder();
		int[] num_list;
		int i;
		
		int num = Integer.parseInt(bf.readLine()); //숫자의 개수
		num_list = new int[num];
		
		for (i = 0; i < num_list.length; i++) {
			num_list[i] = Integer.parseInt(bf.readLine()); //수 입력
		}
        Arrays.sort(num_list); //오름차순 정렬
        
        // arr를 sb에 넣고 출력 --> 이게 시간이 더 단축된다는 것을 알게 됐다.
		for (i = 0; i < num_list.length; i++){
			sb.append(num_list[i]).append('\n');
        }
		System.out.println(sb.toString());
	}
}