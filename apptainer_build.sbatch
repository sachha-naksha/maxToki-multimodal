#!/bin/bash
#SBATCH -J apptainer-build
#SBATCH --output=/projects/bgdb/asachan/methods/maxToki/log/build_%j.out
#SBATCH --account=bgdb-delta-gpu
#SBATCH --partition=gpuA100x4
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64g
#SBATCH --time=04:00:00
set -euo pipefail

export APPTAINER_CACHEDIR=/scratch/bgdb/asachan/apptainer_cache
export APPTAINER_TMPDIR=/scratch/bgdb/asachan/apptainer_tmp
mkdir -p $APPTAINER_CACHEDIR $APPTAINER_TMPDIR

cd /projects/bgdb/asachan/methods/maxToki

apptainer build --fakeroot \
    /projects/bgdb/asachan/containers/maxtoki-dev.sif \
    Apptainer.def

echo "Build complete: $(ls -lh /projects/bgdb/asachan/containers/maxtoki-dev.sif)"