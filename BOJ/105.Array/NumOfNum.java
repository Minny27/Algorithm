import java.io.*;

// 2577
// 숫자의 개수
public class NumOfNum {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        
        StringBuilder sb = new StringBuilder(); // 결과 값 저장
        int[] arr = new int[10]; // 0 ~ 10의 개수 판별
        // 값 하나씩 비교를 위해서 String -> char[]
        String s = String.valueOf((Integer.parseInt(br.readLine()) * Integer.parseInt(br.readLine()) * Integer.parseInt(br.readLine())));
        char[] cArr = s.toCharArray();
        // System.out.println(s);

        for(int i = 0; i < cArr.length; i++) {
            switch(cArr[i] - '0') {
            case 0: arr[0]++; break;
            case 1: arr[1]++; break;
            case 2: arr[2]++; break;
            case 3: arr[3]++; break;
            case 4: arr[4]++; break;
            case 5: arr[5]++; break;
            case 6: arr[6]++; break;
            case 7: arr[7]++; break;
            case 8: arr[8]++; break;
            case 9: arr[9]++; break;
            default: break;
            }
        }
        for(int i = 0; i < arr.length; i++)
            sb.append(arr[i] + "\n");
        System.out.print(sb);
    }
}

// 참고 코드
// String temp = String.valueOf(A*B*C);
		
		// for (int i = 0; i < temp.length(); i++) {
		// 	int idx = Integer.parseInt(temp.substring(i, i+1));
		// 	countArr[idx]++;
        // }
        
        // for (int i = 0; i < result.length(); i++) {
        //     count[(result.charAt(i) - '0')]++;
        // }