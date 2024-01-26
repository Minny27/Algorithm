// 수 나누기 게임
// 문제 유형: 수학(에라토스테네스의 체)
// 느낀점: O(n^2)로 해결이 안 된다는 것을 알긴 알았으나.. 문제 풀이 아이디어를 얻기 힘들어서 질문하기를 참고
// 풀이 방법: 1000000까지 array를 만들어놓고 입력 받은 값을 기준으로 배수만 체크하기
// 배수 중에서 입력받은 값이 있으면, 그 값의 인덱스 + 1, 배수 인덱스 - 1

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var flag = Array(repeating: false, count: 1000001)
var answer = Array(repeating: 0, count: 1000001)

for num in arr {
    flag[num] = true
}

for num in arr {
    for i in stride(from: num+num, to: 1000001, by: num) {
        if flag[i] {
            answer[num] += 1
            answer[i] -= 1
        }
    }
}

for num in arr {
    print(answer[num], separator: " ")
}
