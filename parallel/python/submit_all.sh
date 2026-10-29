EXT=slurm
CMD=sbatch

for i in *.$EXT; do echo "$CMD $i"; $CMD $i; done


