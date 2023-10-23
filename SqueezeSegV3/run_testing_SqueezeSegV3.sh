#!/bin/sh

#SBATCH -J SqueezeSegV3-53_testing
#SBATCH -o ./SqueezeSegV3-53_testing_id%j.txt
#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --gres=gpu:a100_80g:1
#SBATCH --time=0-10:00:00
#SBATCH --mem=30G

module load miniconda3
source "$CONDA_PREFIX/etc/profile.d/conda.sh"
module load gnu7
module load cuda/11.2
conda activate sphere_former

## Run testing script on classic data with pre-trained model
#python infer.py -d ../dataset -l SemKITTI_predictions/classical -m weights/SSGV3-53_classic -s valid

## Run testing script on wet ground data with pre-trained model
#python infer.py -d ../Robo3D/create/semantickitti_c/save_root/wet_ground -l SemKITTI_predictions/wet_ground -m weights/SSGV3-53_classic -s valid

## Run testing script on fog data with pre-trained model
#python infer.py -d ../Robo3D/create/semantickitti_c/save_root/fog -l SemKITTI_predictions/fog -m weights/SSGV3-53_classic -s valid

## Run testing script on motion blur data with pre-trained model
#python infer.py -d ../Robo3D/create/semantickitti_c/save_root/motion_blur -l SemKITTI_predictions/motion_blur -m weights/SSGV3-53_classic -s valid

## Run testing script on wet ground, fog and motion blur data with fine-tuned model
python infer.py -d ../Robo3D/create/semantickitti_c/save_root -l SemKITTI_predictions -m weights/SSGV3-53_fine_tuned -s valid

conda deactivate

