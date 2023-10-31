#!/bin/bash
#SBATCH -J cp_cpu
#SBATCH --time=05:00:00

#SBATCH -N 4

#echo ${SLURM_JOB_NODELIST}
#echo start on $(date)

export export PATH=/ocean/projects/bio220064p/ahu1/QE_intel/qe-7.1/build/bin/:$PATH
module load intelmpi/2021.3.0-intel2021.3.0
module use /ocean/projects/bio220064p/ahu1/intel/oneapi/itac/latest/modulefiles
module load itac

export VT_LOGFILE_FORMAT=stfsingle
export VT_PCTRACE=5
export VT_LOGFILE_NAME=itac_cp512.stf

mpirun -trace -np 512 cp.x -pd .true. -inp cp.in
#echo end on $(date)


