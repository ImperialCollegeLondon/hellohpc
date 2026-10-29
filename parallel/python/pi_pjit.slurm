#!/bin/bash
#SBATCH --job-name=pi_pjit
#SBATCH --output=%x.out%j
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=4G
#SBATCH --partition=small

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

ml SciPy-bundle/2024.05-gfbf-2024a
ml numba/0.60.0-foss-2024a

cd $SLURM_SUBMIT_DIR

python pi_pjit.py

