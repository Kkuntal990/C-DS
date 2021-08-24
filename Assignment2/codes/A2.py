import numpy as np
import matplotlib.pyplot as plt

P1 = [3,0]
P2 = [-2, -2]
P3 = [8, 2]

slope1 = (P2[1] - P1[1])/(P2[0] - P1[0])
slope2 = (P3[1] - P1[1])/(P3[0] - P1[0])

print("slope1 == slope2 \n")
print(slope1==slope2)

plt.plot([P2[0], P1[0]], [P2[1], P1[1]])
plt.plot([P1[0], P3[0]], [P1[1], P3[1]], lw = 3)
plt.scatter([P1[0], P2[0], P3[0]], [P1[1], P2[1], P3[1]], color='g')


plt.show()
