// 최댓값과 최솟값
// 문제 유형: 문자열
// 느낀점: 여태까지 마이너스 문자열 정렬하면 정수형이랑 다른지 몰랐음..
// '-', '1'이 나뉜다고도 늦게 파악했네..

func solution(_ s:String) -> String {
    let array = s.components(separatedBy: " ").map { Int($0) ?? 0 }.sorted(by: <)
    return "\(array[0]) \(array[array.count-1])"
}