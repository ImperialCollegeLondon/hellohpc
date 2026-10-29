import time
import os
import multiprocessing as mp
import functools
import operator

def calc_sum(i):       
    psum = 4.0/(1.0 + w*w*(i - 0.5)*(i - 0.5))
    return psum


n = int(10e7)
w = 1.0/n
start_time = time.time()

if __name__ == '__main__':
  pool = mp.Pool(int(os.environ['OMP_NUM_THREADS']))  
  result = pool.map(calc_sum, range(1,n+1))
  pool.close()
  pool.join()

  total = functools.reduce(operator.add, result)
  pi=w*total

  duration = time.time() - start_time

  print(f"{n:,d}", "   ", pi, "   ", duration)


