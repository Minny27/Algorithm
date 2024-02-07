// 날짜 계산
// 문제 유형: 수학, 부루트포스
// 느낀점: 문제를 너무 어렵게 풀려고 해서 시간을 많이 사용..
// 다른 사람의 풀이와 비교하니까 실전에서는 이렇게 풀면 안 되겠다는 것을 느낌
// 풀이 방법: 처음에는 한 번에 나올 수 있는 공식이 있을까 고민했는데, 나머지만 알 수 있기 떄문에 모든 값을 구해야함
// answer를 1씩올리면서 그 값을 15, 28, 19로 각각 나눈 값이 e,s,m이면 그 값 리턴
// 여기서 문제는 15, 28, 19일 때는 나머지가 0인데 그 숫자가 들어있으니 그 부분은 설정해줘야함.
// 나머지가 0이 될때만 0으로 값을 바꿔주는 방식으로 푸는 게 더 현명했음.
// 그리고 while문의 조건이 많아 질때는 무한루프로하고 break 조건을 주는 게 현명해보임.

let l = readLine()!.split(separator: " ").map { Int(String($0))! }

var (e,s,m) = (l[0],l[1],l[2])
e = e == 15 ? 0 : e
s = s == 28 ? 0 : s
m = m == 19 ? 0 : m

var answer = 1

while true {
  if answer % 15 == e && answer % 28 == s && answer % 19 == m {
    print(answer)
    break
  } else {
    answer += 1
  }
}

// 이전 풀이
let l = readLine()!.split(separator: " ").map { Int(String($0))! }

let (e,s,m) = (l[0],l[1],l[2])
var answer = 1

while true {
  if ((answer % 15 == 0 && e == 15) || answer % 15 == e) && ((answer % 28 == 0 && s == 28) || answer % 28 == s) && ((answer % 19 == 0 && m == 19) || answer % 19 == m) {
    print(answer)
    break
  } else {
    answer += 1
  }
}
