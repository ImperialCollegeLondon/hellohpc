#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --partition=small

ml Julia
# before you run pi_serial.jl:
# the code needs BenchmarkTools that can be installed using package manager
# on login node on command line, 
# type ml Julia followed by "julia" to get julia console 
# press "[" to get into package mananger, type "add BenchmarkTools"
# to get out of package manager, type control c 
# to get out of julia type control d

julia $SLURM_SUBMIT_DIR/pi_serial.jl


