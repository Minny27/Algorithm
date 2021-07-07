// 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

// 재한사항
// s는 길이가 1 이상, 100이하인 스트링입니다.

class GetMiddle {
    public String solution(String s) {
        if(s.length() % 2 != 0)
            return s.substring((int)(Math.floor(s.length() / 2)), (int)(Math.ceil(s.length() / 2))+1);
        else 
            return s.substring((int)(Math.floor(s.length() / 2)-1), (int)(Math.ceil(s.length() / 2))+1);
    }
    public static void  main(String[] args){
        GetMiddle sol = new GetMiddle();
        System.out.println((sol.solution("power")));
    }
}