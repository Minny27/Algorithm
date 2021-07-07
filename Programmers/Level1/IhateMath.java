// 수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.

// 1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ... 5개씩
// 2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ... 8개씩
// 3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ... 10개씩

// 1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.

// 제한 조건
// 시험은 최대 10,000 문제로 구성되어있습니다.
// 문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
// 가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.

// import java.util.Arrays;
// import java.util.Vector;

public class IhateMath {
    public int[] solution(int[] answers) {
        int a0[] = { 1, 2, 3, 4, 5 };
        int a1[] = { 2, 1, 2, 3, 2, 4, 2, 5 };
        int a2[] = { 3, 3, 1, 1, 2, 2, 4, 4, 5, 5 };
        int total_corr[] = new int[3];
        int max = 0;
        int lst_rank[] = {};

            for (int i = 0; i < answers.length; i++) {
                if (a0[i % 5] == answers[i]) {
                    total_corr[0]++;
                }
            }

            for (int i = 0; i < answers.length; i++) {
                if (a1[i % 8] == answers[i]) {
                    total_corr[1]++;    
                }
            }

            for (int i = 0; i < answers.length; i++) {
                if (a2[i % 10] == answers[i]) {
                    total_corr[2]++;
                }
            }
        max = total_corr[0];
        for (int i = 1; i < total_corr.length; i++) {
            if (max < total_corr[i]) {
                max = total_corr[i];
            }
        }

        if (max == total_corr[0] && max == total_corr[1] && max == total_corr[2]) {
            lst_rank = new int[3];
            lst_rank[0] = 1;
            lst_rank[1] = 2;
            lst_rank[2] = 3;
            
        } else if ((max == total_corr[0]) && (total_corr[0] == total_corr[1])) {
            lst_rank = new int[2];
            lst_rank[0] = 1;
            lst_rank[1] = 2;

        } else if ((max == total_corr[0]) && (total_corr[0] == total_corr[2])) {
            lst_rank = new int[2];  
            lst_rank[0] = 1;
            lst_rank[1] = 3;

        } else if (max == total_corr[1] && total_corr[1] == total_corr[2]) {
            lst_rank = new int[2];
            lst_rank[0] = 2;
            lst_rank[1] = 3;

        } else if (max == total_corr[0]) {
            lst_rank = new int[1];
            lst_rank[0] = 1;

        } else if (max == total_corr[1]) {
            lst_rank = new int[1];
            lst_rank[0] = 2;

        } else if (max == total_corr[2]) {
            lst_rank = new int[1];
            lst_rank[0] = 3;
        }
        return lst_rank;
    }

    public static void main(String[] args) {
        IhateMath sm = new IhateMath();
        int aaa[] = { 1, 2, 3, 4, 5 };
        int bbb[] = { 1, 3, 2, 4, 2 };
        System.out.println(sm.solution(aaa));
        System.out.println(sm.solution(bbb));

    }
}

// // 수포자들 변수선언
// int a[] = {1,2,3,4,5};
// int b[] = {2,1,2,3,2,4,2,5};
// int c[] = {3,3,1,1,2,2,4,4,5,5};

// // 맞은 개수를 각각 저장할 변수
// int result_a = answers.length ;
// int result_b;
// int result_c;

// if(answers.length > 5) {
// for(int j=5; j<answers.length; j++){
// a[j] = a[j-5];
// }

// for(int i=0; i<answers.length; i++){

// }
// if(answers[i] == a[i]){
// result_a += 1;

/*
 * 벡터를 사용하려고 했으나 실행오류 및 메모리를 많이 잡아먹어서 실행이 실패한다... 후... ㅎㅎ Vector<Integer> v1 =
 * new Vector<Integer>(); Vector<Integer> v2 = new Vector<Integer>();
 * Vector<Integer> v3 = new Vector<Integer>(); int total_corr[] = new int[3]; //
 * 맞은 갯수 int lst_rank[] = {}; int max = 0;
 * 
 * v1.add(1); v1.add(2); v1.add(3); v1.add(4); v1.add(5);
 * 
 * v2.add(2); v2.add(1); v2.add(2); v2.add(3); v2.add(2); v2.add(4); v2.add(2);
 * v2.add(5);
 * 
 * v3.add(3); v3.add(3); v3.add(1); v3.add(1); v3.add(2); v3.add(2); v3.add(4);
 * v3.add(4); v3.add(5); v3.add(5);
 * 
 * if (answers.length > 5) { for (int i = 5; i < answers.length; i++) { v.add[5,
 * i-5] } } }
 * 
 * if (answers.length > 8) { for (int i = 8; i < answers.length; i++) { v.add[8,
 * i-8] } }
 * 
 * if (answers.length > 10) { for (int i = 10; i < answers.length; i++) {
 * v.add[10, i-10] } }
 * 
 * for(int i = 0; i < answers.length; i++) { if(v1.elementAt(i) == answers[i]) {
 * total_corr[0] += 1; } if(v2.elementAt(i) == answers[i]) { total_corr[1] += 1;
 * 
 * } if(v3.elementAt(i) == answers[i]) { total_corr[2] += 1; } }
 */