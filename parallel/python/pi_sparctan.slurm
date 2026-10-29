#!/bin/bash
#SBATCH --job-name=pi_sparctan
#SBATCH --output=%x.out%j
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --partition=small


ml SciPy-bundle
cd $SLURM_SUBMIT_DIR

python pi_sparctan.py

