#!/bin/bash

#SBATCH --job-name=timging_1
#SBATCH --nodes=1
#SBATCH --tasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB 
#SBATCH --time=01:00:00 
#SBATCH --verbose

module purge 
module load intel/19.1.2 openmpi/intel/4.1.1

#make
cd /scratch/sd3201/p4est-2.8.5.5-9ddbb/example/steps
mpirun -np 4 p4est_step3
