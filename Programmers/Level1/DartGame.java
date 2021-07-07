// [1차] 다트 게임
// 문제 설명
// 다트 게임
// 카카오톡에 뜬 네 번째 별! 심심할 땐? 카카오톡 게임별~

// Game Star

// 카카오톡 게임별의 하반기 신규 서비스로 다트 게임을 출시하기로 했다. 다트 게임은 다트판에 다트를 세 차례 던져 그 점수의 합계로 실력을 겨루는 게임으로, 모두가 간단히 즐길 수 있다.
// 갓 입사한 무지는 코딩 실력을 인정받아 게임의 핵심 부분인 점수 계산 로직을 맡게 되었다. 다트 게임의 점수 계산 로직은 아래와 같다.

// 다트 게임은 총 3번의 기회로 구성된다.
// 각 기회마다 얻을 수 있는 점수는 0점에서 10점까지이다.
// 점수와 함께 Single(S), Double(D), Triple(T) 영역이 존재하고 각 영역 당첨 시 점수에서 1제곱, 2제곱, 3제곱 (점수1 , 점수2 , 점수3 )으로 계산된다.
// 옵션으로 스타상(*) , 아차상(#)이 존재하며 스타상(*) 당첨 시 해당 점수와 바로 전에 얻은 점수를 각 2배로 만든다. 아차상(#) 당첨 시 해당 점수는 마이너스된다.
// 스타상(*)은 첫 번째 기회에서도 나올 수 있다. 이 경우 첫 번째 스타상(*)의 점수만 2배가 된다. (예제 4번 참고)
// 스타상(*)의 효과는 다른 스타상(*)의 효과와 중첩될 수 있다. 이 경우 중첩된 스타상(*) 점수는 4배가 된다. (예제 4번 참고)
// 스타상(*)의 효과는 아차상(#)의 효과와 중첩될 수 있다. 이 경우 중첩된 아차상(#)의 점수는 -2배가 된다. (예제 5번 참고)
// Single(S), Double(D), Triple(T)은 점수마다 하나씩 존재한다.
// 스타상(*), 아차상(#)은 점수마다 둘 중 하나만 존재할 수 있으며, 존재하지 않을 수도 있다.
// 0~10의 정수와 문자 S, D, T, *, #로 구성된 문자열이 입력될 시 총점수를 반환하는 함수를 작성하라.
import java.util.ArrayList;

public class DartGame {
    public int solution(String dartResult) {
        ArrayList<Integer> dartList = new ArrayList<Integer>();
        int tmp;
        for (int i = 0; i < dartResult.length(); i++) {
            if (dartResult.charAt(i) - '0' >= 0 && dartResult.charAt(i) - '0' <= 9) {
                if (dartResult.charAt(i) - '0' == 1 && dartResult.charAt(i + 1) - '0' == 0){
                    dartList.add(10);
                    i += 1;
                }
                else {
                    dartList.add(dartResult.charAt(i) - '0');
                }
            } 
            else if (dartResult.charAt(i) == 'S') {} 
            else if (dartResult.charAt(i) == 'D') {
                if (i == 1 || i == 2) {
                    tmp = dartList.get(0) * dartList.get(0);
                    dartList.set(0, tmp);
                } 
                else if (i == 3 || i == 4 || (i == 5 && dartList.get(1) == 10)) {
                    tmp = dartList.get(1) * dartList.get(1);
                    dartList.set(1, tmp);
                } 
                else if (i == 5 || i == 6 || i == 7 || i == 8) {
                    tmp = dartList.get(2) * dartList.get(2);
                    dartList.set(2, tmp);
                }
            } 
            else if (dartResult.charAt(i) == 'T') {
                if (i == 1 || i == 2) {
                    tmp = dartList.get(0) * dartList.get(0) * dartList.get(0);
                    dartList.set(0, tmp);
                } 
                else if (i == 3 || i == 4 || (i == 5 && dartList.get(1) == 10)) {
                    tmp = dartList.get(1) * dartList.get(1) * dartList.get(1);
                    dartList.set(1, tmp);
                }
                else if (i == 5 || i == 6 || i == 7 || i == 8) {
                    tmp = dartList.get(2) * dartList.get(2) * dartList.get(2);
                    dartList.set(2, tmp);
                }
            } 
            else if (dartResult.charAt(i) == '*') {
                if (i == 2) {
                    tmp = dartList.get(0) * 2;
                    dartList.set(0, tmp);
                } 
                else if (i == 4 || i == 5) {
                    tmp = dartList.get(0) * 2;
                    dartList.set(0, tmp);
                    tmp = dartList.get(1) * 2;
                    dartList.set(1, tmp);
                } 
                else if (i == 6 || i == 7 || i == 8) {
                    tmp = dartList.get(1) * 2;
                    dartList.set(1, tmp);
                    tmp = dartList.get(2) * 2;
                    dartList.set(2, tmp);
                    System.out.println(dartList.get(2));
                }
            } 
            else if (dartResult.charAt(i) == '#') {
                if (i == 2){
                    tmp = (-1) * dartList.get(0);
                    dartList.set(0, tmp);
                }
                else if (i == 4 || i == 5) {
                    tmp = (-1) * dartList.get(1);
                    dartList.set(1, tmp);
                }
                else if (i == 6 || i == 7 || i == 8) {
                    tmp = (-1) * dartList.get(2);
                    dartList.set(2, tmp);
                }            
            }
        }
        return dartList.get(0) + dartList.get(1) + dartList.get(2);
    }

    public static void main(String[] args) {
        DartGame dg = new DartGame();
        System.out.println(dg.solution("1S2D*3T"));
        System.out.println(dg.solution("1D2S#10S"));
        System.out.println(dg.solution("1D2S0T"));
        System.out.println(dg.solution("1S*2T*3S"));
        System.out.println(dg.solution("1D#2S*3S"));
        System.out.println(dg.solution("1T2D3D#"));
        System.out.println(dg.solution("1D2S3T*"));
        System.out.println(dg.solution("0D0D0D"));
        System.out.println(dg.solution("10D10D10D"));
        System.out.println(dg.solution("10S#10S*10S*"));

    }
}
