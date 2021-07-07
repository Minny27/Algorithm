class FindKim {
    public String solution(String[] seoul) {
        String answer = "";
        // int x;
        
        for(int i=0; i<seoul.length; i++) {
            if(seoul[i].equals("Kim")) { // equals와 '=='의 차이는 equals는 저장되어 있는 값에 대한 비교, '=='는 저장되어 있는 주소 값 비교
                answer = "김서방은 " + i + "에 있다.";
                // x = i;
                break;
            }
        }
            // return "김서방" + x + "있다" ;
            return answer;
    }
    public static void main(String[] args) {
        FindKim kim = new FindKim();
        String[] kkimm = {"Jane","aa", "Kim"};
        System.out.println(kim.solution(kkimm));
    }
}