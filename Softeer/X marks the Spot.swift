// X marks the Spot
// 문제 유형: 문자열
// 느낀점: 0.005초로 안 되는 게 좀..
// 풀이 방법: 문자열의 'x'를 firstIndex 함수로 인덱스를 리턴받고 인덱싱 후,
// 대문자로 변환

let n = Int(String(readLine()!))!
var answer = ""

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { String($0) }
    let (s,e) = (line[0],line[1])
    if let index = s.firstIndex(of:"x") {
       answer += e[index].uppercased() 
    } else if let index = s.firstIndex(of:"X") {
       answer += e[index].uppercased() 
    }
}
print(answer)