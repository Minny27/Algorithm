public class GuessCollatz {
    public int solution(int num) {
        int answer = 0;
        long long_num = num;
        // long long_num = Long.valueOf(num);


        while(long_num != 1) {
            if(answer >= 500) return -1;

            if(long_num % 2 == 0) {
                long_num = long_num / 2;
                answer += 1;
            }
            else if(long_num % 2 != 0) {
                long_num = (long_num * 3) + 1;
                answer += 1;
            }
        }
        return answer;
    }
    public static void main(String[] args) {
        GuessCollatz gc = new GuessCollatz();
        System.out.println(gc.solution(6));
        System.out.println(gc.solution(16));
        System.out.println(gc.solution(626331));
    }
}
