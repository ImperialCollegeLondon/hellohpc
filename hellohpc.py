
import os
from time import ctime

try:
   print ("Hello from %s on %s.\nI'm job %s submitted by %s from \n%s \nand executed in \n%s." \
   % (os.environ['HOSTNAME'], ctime(), os.environ['SLURM_JOBID'], \
   os.environ['USER'], os.environ['SLURM_SUBMIT_DIR'], os.environ['PWD'] ))
except:
  print ("I will only run if submitted via the resource manager. ")
