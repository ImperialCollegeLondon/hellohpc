#!/bin/bash

#SBATCH --job-name=test
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=small
#SBATCH --array=1-9

ml SciPy-bundle

cd $SLURM_SUBMIT_DIR
python matrix_array.py




