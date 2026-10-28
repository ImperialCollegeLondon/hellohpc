for i in */*.slurm; do cd `dirname $i`; echo `pwd`; echo "sbatch `basename $i`"; sbatch `basename $i`; cd ..; done
