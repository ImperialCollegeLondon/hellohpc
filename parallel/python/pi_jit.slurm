#!/bin/bash
#SBATCH --job-name=pi_jit
#SBATCH --output=%x.out%j
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=small


ml SciPy-bundle/2024.05-gfbf-2024a
ml numba/0.60.0-foss-2024a

cd $SLURM_SUBMIT_DIR

python pi_jit.py

