class SumNum {
    public long solution(int a, int b) {
        long answer = 0;
        int i;
        for(i=Math.min(a, b); i<=Math.max(a,b); i++){
           answer += i; 
        }
        return answer;
    }
    public static void  main(String[] args){
        SumNum s = new SumNum();
        System.out.println(s.solution(2, 5));
    }
}