import time
import os
import multiprocessing as mp
import functools
import operator

def calc_sum(x):
    psum = 0.0
    #print((x*chunk)-chunk+1)
    #print((x*chunk))

    for i in range((x*chunk)-chunk+1 ,(x*chunk)+1):       
        psum = psum + 4.0/(1.0 + w*w*(i - 0.5)*(i - 0.5))
    return psum



n = int(10e9)
w = 1.0/n
chunk = 10000

if __name__ == '__main__':

  start_time = time.time()

  pool = mp.Pool(int(os.environ['OMP_NUM_THREADS'])) 
  result = pool.map(calc_sum, range(1,int(n/chunk)+1))
  pool.close()
  pool.join()

  total = functools.reduce(operator.add, result)
  pi=w*total

  duration = time.time() - start_time
  print(f"{n:,d}", "   ", pi, "   ", duration)


