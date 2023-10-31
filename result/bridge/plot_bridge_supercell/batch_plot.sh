#!/bin/bash

#SBATCH -J scala_qe
#SBATCH -N 1
#SBATCH --time=16:00:00

export PATH=/jet/home/ahu1/QE/qe-7.1/build/bin/:$PATH
module load openmpi/4.0.2-intel20.4
export UCX_LOG_LEVEL=error

nodes=1
np=8
output_dir="node${nodes}_output"
cd /ocean/projects/bio220064p/ahu1/QE_intel/supercell
output_file="/ocean/projects/bio220064p/ahu1/QE_intel/supercell/plot/${output_dir}/${nodes}_${np}.out"
mpirun -np $np cp.x -pd .true. -inp cp.in > $output_file 2>&1
