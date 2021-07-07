
// 4673
// 셀프 넘버	
public class SelfNum {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        // 셀프 넘버 판별 배열 
        boolean[] selfNum = new boolean[10003]; // 근데 왜 10001개 까지하면 에러가 나는지 모르겠다.. 
        
        // 생성자는 true
        for(int i = 1; i <= 9972; i++) 
            selfNum[i + i / 10000 + ((i / 1000) % 10) + ((i / 100) % 10) + ((i / 10) % 10) + (i % 10)] = true;

        // 셀프 넘버만 축적
        for(int i = 1; i <= 10000; i++)
            if(selfNum[i] == false) sb.append(i + "\n");
        System.out.print(sb);
    }
}
