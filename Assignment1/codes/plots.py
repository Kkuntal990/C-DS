#%%
import numpy as np
import matplotlib.pyplot as plt

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
