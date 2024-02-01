#!/bin/bash
#SBATCH --job-name=enh_OPT_298
#SBATCH --account=escience
#SBATCH --partition=gpu-a40
#SBATCH --nodes=1
#SBATCH --cpus-per-task=6
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:a40:1


#SBATCH --time=60:00:00
#SBATCH --mem=60gb


#export GMX_GPU_DD_COMMS=true
#export GMX_GPU_PME_PP_COMMS=true
#export GMX_FORCE_UPDATE_DEFAULT_GPU=true

export GMX_FORCE_GPU_AWARE_MPI=1

# Specify that GPU direct communication should be used
export GMX_ENABLE_DIRECT_GPU_COMM=1

# Specify that GPU PME decomposition should be used
export GMX_GPU_PME_DECOMPOSITION=1


## SBATCH --workdir=$SLURM_SUBMIT_DIR

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR

echo "working directory = "$SLURM_SUBMIT_DIR


module load cuda/11.8.0
module load cmake/3.20.0
module load ompi/4.1.4
module load cesg/boost/1.76.0
module load cesg/python/3.8.10
module load cesg/fftw/3.3.9
module load stf/netcdf/c-ompi/4.8.1
module load gcc/10.2.0

source /mmfs1/gscratch/pfaendtner/ashoji/gromacs/gromacs-2022.5/bin/GMXRC
source /mmfs1/gscratch/pfaendtner/ashoji/gromacs/plumed2/sourceme.sh


gmx mdrun -v -deffnm prod -bonded gpu -update gpu -nb gpu



exit 
