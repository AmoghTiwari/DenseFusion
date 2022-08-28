#!/bin/bash
#SBATCH -A research
#SBATCH -n 8
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=2G
#SBATCH --time=4-0:00:00
#SBATCH --mail-user=amogh.tiwari@research.iiit.ac.in
#SBATCH --mail-type=ALL
#SBATCH --output=sbatch_output.txt

echo "running on gnode"
set -x

conda init bash
eval "$(conda shell.bash hook)"
conda activate densefusion

cd /home/amoghtiwari/DenseFusion

bash ./initialize_densefusion.sh

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 ./tools/train.py --dataset linemod\
  --dataset_root /ssd_scratch/cvit/amoghtiwari/densefusion/data/Linemod_preprocessed\

cd /ssd_scratch/cvit/amoghtiwari/densefusion/
zip -r checkpoints
scp -r checkpoints.zip amoghtiwari@ada.iiit.ac.in:/share3/amoghtiwari/densefusion_checkpoints
