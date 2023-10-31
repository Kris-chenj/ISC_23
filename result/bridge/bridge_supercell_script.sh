#!/bin/bash
#SBATCH -J supercell_cpu
#SBATCH --time=01:00:00

#SBATCH -N 4

#echo ${SLURM_JOB_NODELIST}
#echo start on $(date)
export export PATH=/jet/home/ahu1/QE/qe-7.1/build/bin/:$PATH
module load openmpi/4.0.2-intel20.4

mpirun -np 128 --map-by ppr:16:socket:PE=4 --bind-to core cp.x -pd .true. -inp cp.in
#echo end on $(date)


