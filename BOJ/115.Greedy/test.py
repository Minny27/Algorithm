import sys
import heapq
n = int(sys.stdin.readline().rstrip("\n"))
nums = []
sums = [0]*(1000+1)
for i in range(n):
    day, value = map(int, sys.stdin.readline().rstrip("\n").split())
    nums.append([-value,day,value])
heapq.heapify(nums)
while nums:
    temp = heapq.heappop(nums)
    for i in range(temp[1],0,-1):
        if(sums[i]==0):
            sums[i]=temp[2]
            break

print(sum(sums))