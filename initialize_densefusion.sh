mkdir -p /ssd_scratch/cvit/amoghtiwari/densefusion/
cd /ssd_scratch/cvit/amoghtiwari/densefusion/
mkdir data
mkdir checkpoints

cd data
scp amoghtiwari@ada.iiit.ac.in:/share3/amoghtiwari/data/Linemod_preprocessed_for_densefusion.zip ./
unzip Linemod_preprocessed_for_densefusion.zip
rm Linemod_preprocessed_for_densefusion.zip

cd ../checkpoints
scp amoghtiwari@ada.iiit.ac.in:/share3/amoghtiwari/checkpoints/densefusion_trained_checkpoints.zip ./
unzip densefusion_trained_checkpoints.zip
rm densefusion_trained_checkpoints.zip
