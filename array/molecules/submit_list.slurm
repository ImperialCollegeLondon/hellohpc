#!/bin/bash

#SBATCH --job-name=test
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=small
#SBATCH --array=1-6


ml Python

#change working directory to submit dir
cd $SLURM_SUBMIT_DIR

#pick the right input file using $PBS_ARRAY_INDEX
INFILE=$(ls -1 *pdb | head -n $SLURM_ARRAY_TASK_ID | tail -n 1)

#run python script
python stats.py $INFILE ${INFILE}.out

#sanity check - log the command in the PBS log file
echo "./stats.py $INFILE ${INFILE}.out"





