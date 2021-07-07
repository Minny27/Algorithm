// 행렬의 덧셈
// 문제 설명
// 행렬의 덧셈은 행과 열의 크기가 같은 두 행렬의 같은 행, 같은 열의 값을 서로 더한 결과가 됩니다. 2개의 행렬 arr1과 arr2를 입력받아, 행렬 덧셈의 결과를 반환하는 함수, solution을 완성해주세요.

// 제한 조건
// 행렬 arr1, arr2의 행과 열의 길이는 500을 넘지 않습니다.

// 먼저 두 배열의 행과 열의 갯수가 같은 지 확인
// 각 행이나 열에 원소의 갯수는 같다고 가정
public class SumOfMatrix {
    public int[][] solution(int[][] arr1, int[][] arr2) {
        int[][] answer = new int[arr1.length][arr1[0].length];

        if (arr1.length == arr2.length && arr1[0].length == arr2[0].length) {
            for (int i = 0; i < arr1.length; i++) {
                for (int j = 0; j < arr1[0].length; j++) {
                    answer[i][j] = arr1[i][j] + arr2[i][j];
                }
            }
        }
        return answer;
    }

    public static void main(String[] args) {
        SumOfMatrix som = new SumOfMatrix();
        int[][] arr1 = { { 1, 2 }, { 3, 4 } };
        int[][] arr2 = { { 3, 4 }, { 5, 6 } };

        // int[][] arr1 = {{1,2}, {3,4}};
        // int[][] arr2 = {{3,4}, {5,6}};

        for (int i = 0; i < arr1.length; i++) {
            for (int j = 0; j < arr1[0].length; j++) {
                System.out.print(som.solution(arr1, arr2));
            }
            System.out.println();
        }
    }
}