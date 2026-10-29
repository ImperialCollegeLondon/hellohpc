#!/bin/bash
#SBATCH --job-name=hello_mpip
#SBATCH --output=%x.out%j
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=1
#SBATCH --mem=32G
#SBATCH --partition=small


ml mpi4py
ml SciPy-bundle

cd $SLURM_SUBMIT_DIR

mpirun python hello_mpi.py

