from scipy.integrate import quad
import time

start_time = time.time()

def f(x):
    return 1/(1+x*x)

I, err = quad(f, 0, 1)
#print(I*4)
#print(err)

duration = time.time() - start_time

print("scipy", "   ", I*4 , "   ", duration)


