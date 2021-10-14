#%%
import numpy as np
import matplotlib.pyplot as plt
#%%

A = [1, 2, 7]
B = [2, 6, 3]
C = [3, 10, -1]
m = np.array([A, B, C])

fig = plt.figure()
ax = plt.axes(projection='3d')
line = ax.plot(m[:, 0], m[:, 1], m[:, 2])
A = ax.scatter(A[0], A[1], A[2])
B = ax.scatter(B[0], B[1], B[2])
C = ax.scatter(C[0], C[1], C[2])
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_zlabel("z")

plt.legend((A, B, C, line),
           ('A', 'B', 'C', 'line segment'))
plt.savefig('../figs/proof.eps')
# %%
