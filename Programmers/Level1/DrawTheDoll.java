// 게임개발자인 죠르디는 크레인 인형뽑기 기계를 모바일 게임으로 만들려고 합니다.
// 죠르디는 게임의 재미를 높이기 위해 화면 구성과 규칙을 다음과 같이 게임 로직에 반영하려고 합니다.

// 게임 화면은 1 x 1 크기의 칸들로 이루어진 N x N 크기의 정사각 격자이며 위쪽에는 크레인이 있고 오른쪽에는 바구니가 있습니다.
// (위 그림은 5 x 5 크기의 예시입니다). 각 격자 칸에는 다양한 인형이 들어 있으며 인형이 없는 칸은 빈칸입니다. 
// 모든 인형은 1 x 1 크기의 격자 한 칸을 차지하며 격자의 가장 아래 칸부터 차곡차곡 쌓여 있습니다. 게임 사용자는 크레인을 좌우로 움직여서
// 멈춘 위치에서 가장 위에 있는 인형을 집어 올릴 수 있습니다. 집어 올린 인형은 바구니에 쌓이게 되는 데, 이때 바구니의 가장 아래 칸부터 인형이 순서대로 쌓이게 됩니다. 다음 그림은 [1번, 5번, 3번] 위치에서 순서대로 인형을 집어 올려 바구니에 담은 모습입니다.

// 만약 같은 모양의 인형 두 개가 바구니에 연속해서 쌓이게 되면 두 인형은 터뜨려지면서 바구니에서 사라지게 됩니다. 위 상태에서 이어서 [5번] 위치에서 인형을 집어 바구니에 쌓으면 같은 모양 인형 두 개가 없어집니다.

// 크레인 작동 시 인형이 집어지지 않는 경우는 없으나 만약 인형이 없는 곳에서 크레인을 작동시키는 경우에는 아무런 일도 일어나지 않습니다. 또한 바구니는 모든 인형이 들어갈 수 있을 만큼 충분히 크다고 가정합니다. (그림에서는 화면표시 제약으로 5칸만으로 표현하였음)

// 게임 화면의 격자의 상태가 담긴 2차원 배열 board와 인형을 집기 위해 크레인을 작동시킨 위치가 담긴 배열 moves가 매개변수로 주어질 때, 크레인을 모두 작동시킨 후 터트려져 사라진 인형의 개수를 return 하도록 solution 함수를 완성해주세요.

// [제한사항]
// board 배열은 2차원 배열로 크기는 5 x 5 이상 30 x 30 이하입니다.
// board의 각 칸에는 0 이상 100 이하인 정수가 담겨있습니다.
// 0은 빈 칸을 나타냅니다.
// 1 ~ 100의 각 숫자는 각기 다른 인형의 모양을 의미하며 같은 숫자는 같은 모양의 인형을 나타냅니다.
// moves 배열의 크기는 1 이상 1,000 이하입니다.
// moves 배열 각 원소들의 값은 1 이상이며 board 배열의 가로 크기 이하인 자연수입니다.
import java.util.Stack;

public class DrawTheDoll {
    public int solution(int[][] board, int[] moves) {
        int answer = 0;
        Stack<Integer> dollStack = new Stack<Integer>();
        int isSamedoll[] = new int[2];
        for (int i = 0; i < moves.length; i++) {
            for (int j = 0; j < board.length; j++) {
                int idx = moves[i] - 1;
                if (board[j][idx] == 0) continue;
                else {
                    if (!dollStack.isEmpty()) {
                        isSamedoll[0] = dollStack.pop();
                        isSamedoll[1] = board[j][idx];
                        if (isSamedoll[0] == isSamedoll[1]) {
                            board[j][idx] = 0;
                            answer += 2;
                            // if(dollStack.size() >= 2) {
                            //     isSamedoll[0] = dollStack.pop();
                            //     isSamedoll[1] = dollStack.pop();
                            //     if(isSamedoll[0] == isSamedoll[1]) answer +=2;
                            //     else dollStack.push(isSamedoll[1]); dollStack.push(isSamedoll[1]);
                            // }
                            break;
                        }
                        else {
                            board[j][idx] = 0;
                            dollStack.push(isSamedoll[0]); 
                            dollStack.push(isSamedoll[1]); 
                            break;
                        }
                    } 
                    else dollStack.push(board[j][idx]); board[j][idx] = 0; break;
                }

            }
        }return answer;

    }

    public static void main(String[] args) {
        DrawTheDoll dtd = new DrawTheDoll();
        System.out.println(dtd.solution(new int[][] { { 0, 0, 0, 0, 0 }, { 0, 0, 1, 0, 3 }, { 0, 2, 5, 0, 1 },
                { 4, 2, 4, 4, 2 }, { 3, 5, 1, 3, 1 } }, new int[] { 1, 5, 3, 5, 1, 2, 1, 4 }));

        System.out.println(dtd.solution(new int[][] { { 0, 0, 0, 0, 0 }, { 0, 0, 1, 0, 3 }, { 0, 2, 5, 0, 1 },
                { 0, 2, 4, 4, 2 }, { 0, 5, 1, 3, 1 } }, new int[] { 1, 1, 1, 1, 1, 1, 1, 1 }));

        System.out.println(dtd.solution(new int[][] { { 0, 2, 0, 0, 0 }, { 0, 5, 1, 0, 3 }, { 5, 5, 5, 0, 1 },
                { 2, 2, 4, 4, 2 }, { 5, 5, 1, 3, 1 } }, new int[] { 1, 1, 1, 2, 2, 2, 2, 2 }));

        System.out.println(dtd.solution(new int[][] {   { 0, 0, 1, 0, 0 },
                                                        { 0, 0, 1, 0, 0 }, 
                                                        { 0, 2, 1, 0, 0 },
                                                        { 0, 2, 1, 0, 0 }, 
                                                        { 0, 2, 1, 0, 0 } }, new int[] { 2, 3, 3, 2, 2, 3, 1 }));

    }
}

// public int solution(int[][] board, int[] moves) {
// int answer = 0;
// int dollArr[] = new int[2];
// Stack<Integer> stack1 = new Stack<Integer>();
// Stack<Integer> stack2 = new Stack<Integer>();
// Stack<Integer> stack3 = new Stack<Integer>();
// Stack<Integer> stack4 = new Stack<Integer>();
// Stack<Integer> stack5 = new Stack<Integer>();
// Stack<Integer> result = new Stack<Integer>();

// for (int i = board.length - 1; i >= 0; i--) {
// if(board[i][0] != 0) stack1.push(board[i][0]);
// if(board[i][1] != 0) stack2.push(board[i][1]);
// if(board[i][2] != 0) stack3.push(board[i][2]);
// if(board[i][3] != 0) stack4.push(board[i][3]);
// if(board[i][4] != 0) stack5.push(board[i][4]);
// }

// for (int i = 0; i < moves.length; i++) {
// if(moves[i] == 1){
// if (!result.empty() && !stack1.empty()) {
// dollArr[0] = result.pop();
// dollArr[1] = stack1.pop();
// if (dollArr[0] == dollArr[1]) {
// answer += 2;
// }
// else {
// result.push(dollArr[0]);
// result.push(dollArr[1]);
// }
// }
// else if (stack1.empty()) continue;
// else {
// result.push(stack1.pop());
// }
// }
// else if(moves[i] == 2){
// if (!result.empty() && !stack2.empty()) {
// dollArr[0] = result.pop();
// dollArr[1] = stack2.pop();
// if (dollArr[0] == dollArr[1]) {
// answer += 2;
// }
// else {
// result.push(dollArr[0]);
// result.push(dollArr[1]);
// }
// }
// else if (stack2.empty()) continue;
// else {
// result.push(stack2.pop());
// }
// }
// else if(moves[i] == 3){
// if (!result.empty() && !stack3.empty()) {
// dollArr[0] = result.pop();
// dollArr[1] = stack3.pop();
// if (dollArr[0] == dollArr[1]) {
// answer += 2;
// }
// else {
// result.push(dollArr[0]);
// result.push(dollArr[1]);
// }
// }
// else if (stack3.empty()) continue;
// else {
// result.push(stack3.pop());
// }
// }
// else if(moves[i] == 4){
// if (!result.empty() && !stack4.empty()) {
// dollArr[0] = result.pop();
// dollArr[1] = stack4.pop();
// if (dollArr[0] == dollArr[1]) {
// answer += 2;
// }
// else {
// result.push(dollArr[0]);
// result.push(dollArr[1]);
// }
// }
// else if (stack4.empty()) continue;
// else {
// result.push(stack4.pop());
// }
// }
// else if(moves[i] == 5){
// if (!result.empty() && !stack5.empty()) {
// dollArr[0] = result.pop();
// dollArr[1] = stack5.pop();
// if (dollArr[0] == dollArr[1]) {
// answer += 2;
// }
// else {
// result.push(dollArr[0]);
// result.push(dollArr[1]);
// }
// }
// else if (stack5.empty()) continue;
// else {
// result.push(stack5.pop());
// }
// }
// }
// return answer;
// }

// public static void main(String[] args) {
// DrawTheDoll dtd = new DrawTheDoll();
// System.out.println(dtd.solution(new int[][] { { 0, 0, 0, 0, 0 },
// { 0, 0, 1, 0, 3 },
// { 0, 2, 5, 0, 1 },
// { 4, 2, 4, 4, 2 },
// { 3, 5, 1, 3, 1 } }, new int[] { 1, 5, 3, 5, 1, 2, 1, 4 }));

// System.out.println(dtd.solution(new int[][] { { 0, 0, 0, 0, 0 },
// { 0, 0, 1, 0, 3 },
// { 0, 2, 5, 0, 1 },
// { 0, 2, 4, 4, 2 },
// { 0, 5, 1, 3, 1 } }, new int[] { 1, 5, 3, 5, 1, 2, 1, 4 }));

// System.out.println(dtd.solution(new int[][] { { 0, 2, 0, 0, 0 },
// { 0, 5, 1, 0, 3 },
// { 5, 5, 5, 0, 1 },
// { 2, 2, 4, 4, 2 },
// { 5, 5, 1, 3, 1 } }, new int[] { 1, 1, 1, 2, 2, 2, 2, 2 }));

// }