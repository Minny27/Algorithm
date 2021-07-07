import java.util.*;
import java.io.*;

// 3009
// 네 번째 점

public class Rectangle {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        ArrayList<Integer> x_axis = new ArrayList<>();
        ArrayList<Integer> y_axis = new ArrayList<>();

        // x축 y축 ArrayList를 각각 만들어서 같은 위치에 있는 값을 지우고 남는 것을 출력
        for (int i = 0; i < 3; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            Integer x = Integer.parseInt(st.nextToken());
            Integer y = Integer.parseInt(st.nextToken());
            if (x_axis.contains(x))
                x_axis.remove(x);
            else
                x_axis.add(x);

            if (y_axis.contains(y))
                y_axis.remove(y);
            else
                y_axis.add(y);
        }
        sb.append(x_axis.get(0) + " " + y_axis.get(0));
        System.out.println(sb);
    }
}
