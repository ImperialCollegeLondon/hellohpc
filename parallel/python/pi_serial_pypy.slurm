#!/bin/bash
#SBATCH --job-name=pi_serial_pypy
#SBATCH --output=%x.out%j
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=small


ml SciPy-bundle
cd $SLURM_SUBMIT_DIR

source ~/venv/pypyenv/bin/activate 
pypy pi_serial.py

