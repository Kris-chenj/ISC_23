#!/bin/bash

#SBATCH -J scala_qe
#SBATCH -N 1
#SBATCH --time=3:00:00

export PATH=/jet/home/ahu1/QE/qe-7.1/build/bin/:$PATH
module load openmpi/4.0.2-intel20.4
export UCX_LOG_LEVEL=error

for nodes in 1; do
  for np in $(seq 8 8 $((512/4))); do
    output_dir="node${nodes}_output"
    mkdir -p $output_dir
    output_file="${output_dir}/${nodes}_${np}.out"
    mpirun -np $np cp.x -pd .true. -inp cp.in > $output_file 2>&1
  done
done

