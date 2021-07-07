import java.util.Scanner;

public class Factorial {
    public static int factorial(int num) { // static 함수에서는 static 함수만 참조할 수 있다.
        if(num == 1 || num == 0) 
            return 1;
        else 
            return num * factorial(num - 1);
    }
    // 
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in); // 입력받기 위한 Scanner 객체 생성
        int n = s.nextInt();
        s.close();
        System.out.println(factorial(n));
    }
}
    

