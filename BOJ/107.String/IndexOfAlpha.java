import java.io.*;

// 10809
// 알파벳 찾기
public class IndexOfAlpha {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int[] alpha = new int[26];
        String input = br.readLine();

        // 아스키 코드를 활용한 코드
        // for (int i = 0; i < arr.length; i++) {
		// 	int loc = arr[i] - 97;
		

		// 	if (num[loc] == -1) {
		// 		num[loc] = i;
		// 	}
		// }

        for(int i = 0; i < alpha.length; i++) 
            alpha[i] = -1;
        for(int i = 0; i < input.length(); i++) {
            switch(input.charAt(i)) {
                case 'a': if(alpha[0] == -1) alpha[0] = i; break; case 'j': if(alpha[9] == -1) alpha[9] = i;  break; case 's': if(alpha[18] == -1) alpha[18] = i; break;
                case 'b': if(alpha[1] == -1) alpha[1] = i; break; case 'k': if(alpha[10] == -1) alpha[10] = i; break; case 't': if(alpha[19] == -1) alpha[19] = i; break;
                case 'c': if(alpha[2] == -1) alpha[2] = i; break; case 'l': if(alpha[11] == -1) alpha[11] = i; break; case 'u': if(alpha[20] == -1) alpha[20] = i; break;
                case 'd': if(alpha[3] == -1) alpha[3] = i; break; case 'm': if(alpha[12] == -1) alpha[12] = i; break; case 'v': if(alpha[21] == -1) alpha[21] = i; break;
                case 'e': if(alpha[4] == -1) alpha[4] = i; break; case 'n': if(alpha[13] == -1) alpha[13] = i; break; case 'w': if(alpha[22] == -1) alpha[22] = i; break;
                case 'f': if(alpha[5] == -1) alpha[5] = i; break; case 'o': if(alpha[14] == -1) alpha[14] = i; break; case 'x': if(alpha[23] == -1) alpha[23] = i; break;
                case 'g': if(alpha[6] == -1) alpha[6] = i; break; case 'p': if(alpha[15] == -1) alpha[15] = i; break; case 'y': if(alpha[24] == -1) alpha[24] = i; break;
                case 'h': if(alpha[7] == -1) alpha[7] = i; break; case 'q': if(alpha[16] == -1) alpha[16] = i; break; case 'z': if(alpha[25] == -1) alpha[25] = i; break;
                case 'i': if(alpha[8] == -1) alpha[8] = i; break; case 'r': if(alpha[17] == -1) alpha[17] = i; 
            }
        }
        for(int i = 0; i< alpha.length; i++) 
            sb.append(alpha[i] + " ");
        System.out.println(sb);
    }
}
