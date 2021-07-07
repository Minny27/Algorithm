import java.io.*;

// 2292		
// 벌집		
public class BeeHouse {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int cnt = 1; // 군 늘어날때마다 1씩 증가
        int i = 1; // 군 늘리기
        
        while(n > (1 + 6 * i * (i-1) / 2)) {
            i++;
            cnt++;
        }
        System.out.println(cnt);
    }
    /*
    군 일반항   1 + 6 * n(n - 1) /2
    어떤수      18
        
                1 7 19 37 61
    */
}