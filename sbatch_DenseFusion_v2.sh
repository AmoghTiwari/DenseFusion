#!/bin/bash
#SBATCH -A research
#SBATCH -n 8
#SBATCH -w gnode035
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=4-0:00:00
#SBATCH --mail-user=amogh.tiwari@research.iiit.ac.in
#SBATCH --mail-type=ALL
#SBATCH --output=sbatch_output_v2.txt

echo "running on gnode"
set -x

conda init bash
eval "$(conda shell.bash hook)"
conda activate densefusion


# Initialization Code
mkdir -p /ssd_scratch/cvit/amoghtiwari/densefusion/
cd /ssd_scratch/cvit/amoghtiwari/densefusion/
mkdir data
mkdir checkpoints

cd data
scp amoghtiwari@ada.iiit.ac.in:/share3/amoghtiwari/data/Linemod_preprocessed_for_densefusion.zip ./
unzip Linemod_preprocessed_for_densefusion.zip
rm Linemod_preprocessed_for_densefusion.zip

# Run training code
cd /home/amoghtiwari/DenseFusion
export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 ./tools/train_v2.py --dataset linemod --dataset_root "/ssd_scratch/cvit/amoghtiwari/densefusion/data/Linemod_preprocessed" --outf "/ssd_scratch/cvit/amoghtiwari/densefusion/checkpoints/"

cd /ssd_scratch/cvit/amoghtiwari/densefusion/
scp -r checkpoints amoghtiwari@ada.iiit.ac.in:/share3/amoghtiwari/checkpoints/densefusion_checkpoints
