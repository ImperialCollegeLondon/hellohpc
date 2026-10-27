for i in */*.slurm; do cd `dirname $i`; echo `pwd`; sbatch `basename $i`; cd ..; done

