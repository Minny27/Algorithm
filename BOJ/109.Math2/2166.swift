// 다각형의 면적
// 문제 유형: 기하학(신발끈 공식)
// 느낀점: 처음에는 다각형을 기준으로 정사각형을 그려서 나머지 부분을 빼는 풀이를 생각했는데..
// 신발끈 공식..? 처음들어봤다..
// 근데 공식을 적용해도 계속 틀려서 뭐가 문제일까 봤는데.. 시작점까지를 넣어줘야한다는 것을 간과했음..
// 그리고 신발끈 공식은 한 점을 기준으로 시계 또는 반시계 방향으로 좌표를 알아야한다는 점을 유의해야 할 것.

let n = Int(readLine()!)!
var x = [Double]()
var y = [Double]()
var answer: Double = 0

for _ in 0..<n {
    let c = readLine()!.split(separator: " ").map { Double($0)! }
    x.append(c[0])
    y.append(c[1])
}
x.append(x.first!)
y.append(y.first!)

for i in 0..<n {
    answer += x[i]*y[i+1] - y[i]*x[i+1]
}

print(abs(answer) / 2)
