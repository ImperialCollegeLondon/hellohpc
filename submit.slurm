#!/bin/bash

#SBATCH --job-name=test
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=small

ml Python
python  $SLURM_SUBMIT_DIR/hellohpc.py


