#%%
import numpy as np
import matplotlib.pyplot as plt
import ctypes
import time
from timeit import default_timer as timer

#%%
def y(x):
    maxY = 2**20
    for i in range(maxY):
        if x**i >= 2**32:
            return (i-1)
    
    return 0

#%%
x = np.logspace(0, 28, 200,base=2)
yy = [y(i) for i in x]
plt.xscale('log', base=2)
plt.fill_between(x, yy, 0,
                 facecolor="orange",  
                 color='blue',       
                 alpha=0.2, label="range")
plt.fill_between(x, 250, 0,
                 facecolor="orange",
                 color='red',
                 alpha=0.05, label="co-domain")
plt.grid()   
plt.title("Implementation constraints")
plt.legend()
plt.show()
plt.savefig('../images/constraints', format='png')
# %%

powerFunction = ctypes.CDLL(
    '/home/kuntal990/academic/C-DS/Assignment1/codes/libpow.so')
powerFunction.pp.argtypes = [ctypes.c_int, ctypes.c_int]
powerFunction.tob.argtypes = [ctypes.c_int]


# %%
print('ans = %d' % (powerFunction.pp(3, 4)))

# %%
O = []
x = [i for i in range(64)]
x = [2**i for i in x]
#print(x)
for i in x:
    tmp = []
    for _ in range(10000):
        start = timer()
        val = powerFunction.tob(i)
        end = timer()
        tmp.append(end-start)
    O.append(np.mean(tmp))

# %%
plt.xscale('log', base=2)
plt.scatter(x[3:], O[3:])
plt.grid()
plt.title('running of tob VS b')
plt.show()
# %%
f = open("/home/kuntal990/academic/C-DS/Assignment1/codes/complexity.dat", "rb")
Lines = f.readlines()
X = np.zeros((len(Lines),))
y = np.zeros((len(Lines),))

for i in range(len(Lines)):
	Data = Lines[i].split()
	X[i] = (int(Data[0]))
	y[i] = (int(Data[1]))

# %%
plt.plot(X[3:], y[3:]/1e6)
plt.xscale('log', base=2)
plt.yscale('log')
plt.xlabel('b')
plt.ylabel('time in nanoseconds')
plt.title("Complexity analysis")
plt.show()
# %%
