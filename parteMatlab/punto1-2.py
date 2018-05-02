import numpy as np

a = []
maxNums = []

for i in range(10):
    a.append([])
    for j in range(10):
        temp = int( np.random.random()*19 +1)
        while(temp in a[i]):
            temp = int( np.random.random()*19 +1)
        a[i].append(temp)

for i in range(10):
    maxLoc = 0
    for j in range(10):
        if a[i][j]>maxLoc:
            maxLoc = a[i][j]
    maxNums.append(maxLoc)



print(maxNums)