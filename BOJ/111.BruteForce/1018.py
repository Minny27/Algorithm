# 체스판 다시 칠하기

import sys
input = sys.stdin.readline
n, m = map(int, input().split())
g = [list(map(str, input())) for _ in range(n)]

def solution(n, m):
    ans1 = 2501
    ans2 = 2501
    for h in range(n - 7):
        for w in range(m - 7):
            cnt1 = 0
            cnt2 = 0
            # B 먼저
            for i in range(h, h + 8):
                for j in range(w, w + 8):
                    # w 짝수 열
                    if w % 2 == 0:
                        # i 짝수 행
                        if i % 2 == 0:
                            # 짝수 열
                            if j % 2 == 0 and g[i][j] != 'B':
                                cnt1 += 1
                            # 홀수 열
                            elif j % 2 == 1 and g[i][j] != 'W':
                                cnt1 += 1
                        # i 홀수 행
                        else:
                            # 짝수 열
                            if j % 2 == 0 and g[i][j] != 'W':
                                cnt1 += 1
                            # 홀수 열
                            elif j % 2 == 1 and g[i][j] != 'B':
                                cnt1 += 1
                    # w 홀수 열
                    else:
                        # i 짝수 행
                        if i % 2 == 1:
                            # 홀수 열
                            if j % 2 == 0 and g[i][j] != 'B':
                                cnt1 += 1
                            # 짝수 열
                            elif j % 2 == 1 and g[i][j] != 'W':
                                cnt1 += 1
                        # i 홀수 행
                        else:
                            # 짝수 열
                            if j % 2 == 0 and g[i][j] != 'W':
                                cnt1 += 1
                            # 홀수 열
                            elif j % 2 == 1 and g[i][j] != 'B':
                                cnt1 += 1
            # W 먼저
            for i in range(h, h + 8):
                for j in range(w, w + 8):
                    # w 짝수 열
                    if w % 2 == 0:
                        # i 짝수 행
                        if i % 2 == 0:
                            # 짝수 열
                            if j % 2 == 0 and g[i][j] != 'W':
                                cnt2 += 1
                            # 홀수 열
                            elif j % 2 == 1 and g[i][j] != 'B':
                                cnt2 += 1
                        # i 홀수 행
                        else:
                            # 짝수 열
                            if j % 2 == 0 and g[i][j] != 'B':
                                cnt2 += 1
                            # 홀수 열
                            elif j % 2 == 1 and g[i][j] != 'W':
                                cnt2 += 1
                    # w 홀수 열
                    else:
                        # i 짝수 행
                        if i % 2 == 1:
                            # 홀수 열
                            if j % 2 == 0 and g[i][j] != 'W':
                                cnt2 += 1
                            # 짝수 열
                            elif j % 2 == 1 and g[i][j] != 'B':
                                cnt2 += 1
                        # i 홀수 행
                        else:
                            # 짝수 열
                            if j % 2 == 0 and g[i][j] != 'B':
                                cnt2 += 1
                            # 홀수 열
                            elif j % 2 == 1 and g[i][j] != 'W':
                                cnt2 += 1
            ans1 = min(ans1, cnt1)
            ans2 = min(ans2, cnt2)
    print(min(ans1, ans2))
solution(n, m)