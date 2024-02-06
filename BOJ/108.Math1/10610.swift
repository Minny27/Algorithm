// 30
// 문제 유형: 수학
// 느낀점: 조건을 살짝만 잘못줘도 내림 차순 정렬후, 0을 빼고 3으로 나누어떨어지는 것으로 처리를 했엇는데, 왜 안됐었을까..
// 문제 풀이: 내림차순 정렬 후, 끝 값이 0이면서 문자열 전체가 3으로 나누어 떨어진 값이면 출력,
// 아니면 -1

let s = String(readLine()!).sorted(by: >)

if s.last == Character("0") && s.map({ Int(String($0))! }).reduce(0, +) % 3 == 0 {
  print(s.map { String($0) }.joined())
} else {
  print("-1")
}
