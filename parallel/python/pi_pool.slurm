#!/bin/bash
#SBATCH --job-name=pi_pool
#SBATCH --output=%x.out%j
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=4G
#SBATCH --partition=small

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

ml Python
cd $SLURM_SUBMIT_DIR

python pi_pool_chunk.py

