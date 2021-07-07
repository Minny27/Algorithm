import java.io.*;

// 1157	
// 단어 공부	
public class StudyWord {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        char[] word = br.readLine().toUpperCase().toCharArray();
        int[] alpha = new int[26]; // 알파벳 횟수 기록
        int max = 0; // 가장 많이 입력된 알파벳 획수
        char ans = 0; // 많이 출력된 알파벳 출력을 위한 변수
        int maxCount = 0;

        // a를 0번째 인덱스로 알파벳의 획수를 늘리기
        for(int i = 0; i < word.length; i++) {
            int idx = word[i] - 65;
            alpha[idx]++;
        }   

        // max 값이 2개 이상 나올 수 있기 때문에 max를 먼저 구하기
        for(int i = 0; i < alpha.length; i++) 
            if(alpha[i] > max) max = alpha[i];

        for(int i = 0; i < alpha.length; i++) {
            if(alpha[i] == max) {
                ans = (char)(i + 65);
                maxCount++;
                if(maxCount >= 2)  {// max값이 2개 이상이면 '?' 출력 후 종료
                    System.out.println('?');
                    return;
                }
            }
        }
        System.out.println(ans);
    }
    //예시
    // Mississipi
    // aAzZ
    // zZaMissisipiszzz
    // z
    // baaa
    // aaabbb
    // abcc
    // aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
}
