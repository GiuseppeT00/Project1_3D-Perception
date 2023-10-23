#!/bin/sh

#SBATCH -J SqueezeSegV3-53_fine_tuning
#SBATCH -o ./SqueezeSegV3-53_fine_tuning_id%j.txt
#SBATCH --partition=gpu_guest
#SBATCH --qos=gpu_guest
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --gres=gpu:a100_vbd:1
##SBATCH --gres=gpu:v100_hylab:1
#SBATCH --time=0-23:59:59
#SBATCH --mem=36G
##SBATCH --dependency=afterok:2032487

module load miniconda3
source "$CONDA_PREFIX/etc/profile.d/conda.sh"
module load gnu7
module load cuda/11.2
conda activate sphere_former

## Run training script
python train.py -d ../Robo3D/create/semantickitti_c/save_root \
                -ac config/arch/SSGV353_tuning.yaml \
                -dc config/labels/semantic-kitti_tuning.yaml \
                -p weights/SSGV3-53_classic \
                -l SSGV353_fine_tuning

conda deactivate

