from scipy.integrate import quad
import numpy as np
import time

start_time = time.time()

def f(x):
    return np.sqrt(1 - x**2)

I, err = quad(f, 0, 1)
#print(I*4)
#print(err)

duration = time.time() - start_time

print("scipy", "   ", I*4 , "   ", duration)


