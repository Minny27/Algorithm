// 파일명 정렬
// 문제 유형: 문자열, 정렬
// 풀이 시간: 2시간
// 느낀점: 아 어렵다.. 문제를 어떻게 이렇게 만들지 ㅎㅎㅎ
// Swift로 문자열 슬라이싱 정말 별로인 거 같고.. 숙련도가 더 필요할듯..
// 풀이 방법: head와 number부분을 나누고 합쳐서 정렬해야겠다고 생각함
// head(문자 첫 부분)를 split 함수로 isNumber를 리턴해서 으로 나누고
// number(숫자 첫 부분)를 split 함수로 isLetter를 리턴해서 으로 나눔
// index를 통해서 head의 마지막 index에 number.count값을 offset으로 설정해서
// head와 number를 제외한 나머지 부분을 문자열로 구함
// 정렬 구현은 기본적으로 소문자로 변환했을 때 같으면 number의 내림차순
// 그 이외에는 문자열 오름차순, 문자열이 같으면 숫자 오름차순으로 정렬
// 다른 사람들 풀이를 보니 정규표현식을 사용했는데, 생각도 못했고, 다음에 다시 풀어봐야 할 듯.

func solution(_ files:[String]) -> [String] {
    var letters = [[String]]()
    
    for file in files {
        let head = file.split { $0.isNumber }.map { String($0) }[0]
        let num = file.split { $0.isLetter || $0 == "-" || $0 == "." || $0 == " " }.map { String($0) }[0]
        let index = file.index(head.endIndex, offsetBy: num.count)
        let newArr = [head, num, String(file[index..<file.endIndex])]
        letters.append(newArr)
    }
    
    letters.sort {
        $0[0].lowercased() == $1[0].lowercased() ? Int($0[1])! < Int($1[1])! : ($0[0].lowercased(), Int($0[1])!) < ($1[0].lowercased(), Int($1[1])!)
    }
    
    return letters.map { $0.joined() }
}

// 이전 풀이
// func solution(_ files:[String]) -> [String] {
//     var letters = [[String]]()
    
//     for file in files {
//         let lArr = file.split { $0.isNumber }.map { String($0) }
//         let nArr = file.split { $0.isLetter || $0 == " " || $0 == "." || $0 == "-" }.map { String($0) }
//         let newArr = [lArr[0], nArr[0], (Array(lArr[1..<lArr.count]) + Array(nArr[1..<nArr.count])).joined()]
//         letters.append(newArr)
//     }
    
//     letters.sort {
//         $0[0].lowercased() == $1[0].lowercased() ? Int($0[1])! < Int($1[1])! : ($0[0].lowercased(), Int($0[1])!) < ($1[0].lowercased(), Int($1[1])!)
//     }
    
//     return letters.map { $0.joined() }
// }