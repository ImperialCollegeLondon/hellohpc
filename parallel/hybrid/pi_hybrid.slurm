#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1 
#SBATCH --cpus-per-task=8
#SBATCH --mem=4GB
#SBATCH --partition=capability

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

ml GCC OpenMPI

mpirun $SLURM_SUBMIT_DIR/pi_hybrid




