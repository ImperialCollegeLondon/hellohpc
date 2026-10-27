#!/bin/bash

#SBATCH --job-name=test
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=small


ml Python

#move python script into staging directory
cp $SLURM_SUBMIT_DIR/hellohpc.py $TMPDIR

#run python script and write result in staging directory
python $TMPDIR/hellohpc.py > $TMPDIR/myresult.txt

#move result back to submit directory
mv $TMPDIR/myresult.txt $SLURM_SUBMIT_DIR
rm $TMPDIR/hellohpc.py 

