import java.io.*;

// 1316	
// 그룹 단어 체커		
public class Checker {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int cnt = 0; // 결과값
        char c, bf = 0; // 현재, 이전값

        // 해당 알파벳이 존재하는 경우, 이전 알파벳과 현재 알파벳이 같으면 + 아니면 break
        for(int i = 0; i < n; i++) {
            boolean[] alpha = new boolean[26]; // 알파벳이 하나라도 앞에서 나왔는지 확인
            String line = br.readLine();

            for(int j = 0; j < line.length(); j++) {
                c = line.charAt(j);

                // 첫 알파벳 체크
                if(!alpha[c - 97]) {
                    alpha[c - 97] = true;
                    bf = c;

                    // 모든 알파벳을 체크했다면 cnt++
                    if(j == line.length() - 1) cnt++;
                }

                // 같은 알파벳이 연속으로 나왔을 경우 continue
                else if(c == bf) {
                    bf = c;

                    // 인덱스가 마지막이라면 cnt++
                    if(j == line.length() - 1) cnt++;
                    continue;
                }

                // 이미 나온 알파벳인데 이전 알파벳과 현재 알파벳이 다르면 break;
                else break;
            }
        }
        System.out.println(cnt);
    }
}
