package Ref;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

// 5622
// 다이얼
public class DialRef {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String S = br.readLine();

        int[] alpha = new int[26];
        char[] word = S.toCharArray();
        for(int i =0; i< alpha.length; i++){

            if((i >= 15 && i<= 18)){
                alpha[i] = 8;
            }
            else if(i>= 19 && i<= 21){
                alpha[i] = 9;
            }
            else if((i >= 22)){
                alpha[i]= 10;
            }else{
            alpha[i] = (i/3)+3; // 이런 발상 배워야함
            }
        }

        int time = 0;
        for(int i = 0; i < word.length; i++){
            time += alpha[word[i]-65];
        }

        System.out.println(time);


        }



    }

