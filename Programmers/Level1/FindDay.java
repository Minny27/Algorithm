// import java.util.Calendar;

// 2016년 1월 1일은 금요일입니다. 2016년 a월 b일은 무슨 요일일까요? 
// 두 수 a ,b를 입력받아 2016년 a월 b일이 무슨 요일인지 리턴하는 함수, solution을 완성하세요. 
// 요일의 이름은 일요일부터 토요일까지 각각 SUN,MON,TUE,WED,THU,FRI,SAT
// 입니다. 예를 들어 a=5, b=24라면 5월 24일은 화요일이므로 문자열 TUE를 반환하세요.
// 2016년은 윤년입니다.
// 2016년 a월 b일은 실제로 있는 날입니다. (13월 26일이나 2월 45일같은 날짜는 주어지지 않습니다)
// import java.util.*;

// 예외 처리 다 하고 알고리즘도 맞는 거같은데,, 캘린더에 문제가있나?? 안 되는 이유를 모르겠다..
// 테스트케이스는 되는데 다른 달은 안되고........
// class FindDay {
//     public String solution(int a, int b) {
//         String answer = "";
//         Calendar cal = Calendar.getInstance();
//         if ((a >= 12) || (a < 0)) {
//             return answer = "";
//         }
//         if (a == 1 || a == 3 || a == 5 || a == 7 || a == 8 || a == 10 || a == 12) {
//             if (b > 31 || b < 1)
//                 return answer = "";
//         }

//         if (a == 2) {
//             if (b > 28 || b < 1)
//                 return answer = "";
//         }

//         if (a == 4 || a == 6 || a == 9 || a == 11) {
//             if (b > 30 || b < 1)
//                 return answer = "";
//         }
//         String[] day = { "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT" };
//         cal.set(Calendar.YEAR, 2020);
//         cal.set(Calendar.MONTH, a);
//         cal.set(Calendar.DAY_OF_MONTH, b);
//         int dayIndex = cal.get(Calendar.DAY_OF_WEEK) - 1;
//         // answer = day[dayInt-1];
//         return day[dayIndex];
//     }

class FindDay {
    public String solution(int a, int b) {
        String[] day = { "FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU" };
        int[] date = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        int total_date = 0;
        int date_index = 0;
        if ((a > 0 && a < 13) && b <= date[a - 1]) {
            for (int i = 0; i < a - 1; i++) {
                total_date += date[i];
            }
        // total_date += b;
        total_date += b-1;
        date_index = (total_date % 7);
        //return day[date_index - 1];
        // 왜 인덱스가 -1이 되면 통과가 안되는지 모르겠다... ㅠㅠㅠ        
        return day[date_index];
        }
        else { return "False";}
    }

    public static void main(String[] args) {
        FindDay fd = new FindDay();
        // Calendar cal = Calendar.getInstance();
        // System.out.println(cal);
        System.out.println(fd.solution(5,24));
    }
}