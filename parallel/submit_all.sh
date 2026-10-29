EXT=slurm
CMD=sbatch

for i in */*.$EXT; 
do 
  cd `dirname $i` 
  echo `pwd` 
  echo "$CMD `basename $i`" 
  sbatch `basename $i` 
  cd .. 
done
