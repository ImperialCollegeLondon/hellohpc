#!/bin/bash

#SBATCH --job-name=test
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu


ml PyTorch/2.9.1-foss-2025b-CUDA-12.9.1
ml scikit-learn/1.7.1-gfbf-2025b
ml matplotlib/3.10.5-gfbf-2025b

cd $SLURM_SUBMIT_DIR

python train_evaluate_iris.py 
