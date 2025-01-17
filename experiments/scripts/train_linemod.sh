#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0


# python3 ./tools/train.py --dataset linemod\ --dataset_root /ssd_scratch/cvit/amoghtiwari/densefusion/data/Linemod_preprocessed

python3 ./tools/train.py --dataset linemod\  --dataset_root "/ssd_scratch/cvit/amoghtiwari/densefusion/data/Linemod_preprocessed" --outf "/ssd_scratch/cvit/amoghtiwari/densefusion/checkpoints/"
