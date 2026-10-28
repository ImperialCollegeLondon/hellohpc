#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=8 
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --partition=capability

ml GCC
ml OpenMPI

mpirun $SLURM_SUBMIT_DIR/pi_mpi 

