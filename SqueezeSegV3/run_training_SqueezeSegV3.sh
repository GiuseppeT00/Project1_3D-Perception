#!/bin/sh

#SBATCH -J SqueezeSegV3-53_training
#SBATCH -o ./SqueezeSegV3-53_training_id%j.txt
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --gres=gpu:a100_80g:4
#SBATCH --time=0-23:59:59
#SBATCH --mem=56G
##SBATCH --dependency=afterok:2032487

module load miniconda3
source "$CONDA_PREFIX/etc/profile.d/conda.sh"
module load gnu7
module load cuda/11.2
conda activate sphere_former

## Run training script
python train.py -d ../dataset \
                -ac config/arch/SSGV353.yaml \
                -dc config/labels/semantic-kitti.yaml \
                -l log_training_SSGV353

conda deactivate

