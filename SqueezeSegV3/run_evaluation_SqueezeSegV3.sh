#!/bin/sh

#SBATCH -J SqueezeSegV3-53_evaluation
#SBATCH -o ./SqueezeSegV3-53_evaluation_id%j.txt
#SBATCH --partition=cpu_guest
#SBATCH --qos=cpu_guest
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=0-10:00:00
#SBATCH --mem=86G

module load miniconda3
source "$CONDA_PREFIX/etc/profile.d/conda.sh"
module load gnu7
module load cuda/11.2
conda activate sphere_former

## Run evaluation script on classic data with pre-trained model
#python evaluate_iou.py -d ../dataset -p SemKITTI_predictions/classical --split valid

## Run evaluation script on wet ground data with pre-trained model
#python evaluate_iou.py -d ../Robo3D/create/semantickitti_c/save_root/wet_ground -p SemKITTI_predictions/wet_ground --split valid

## Run evaluation script on fog data with pre-trained model
#python evaluate_iou.py -d ../Robo3D/create/semantickitti_c/save_root/fog -p SemKITTI_predictions/fog --split valid

## Run evaluation script on motion blur data with pre-trained model
#python evaluate_iou.py -d ../Robo3D/create/semantickitti_c/save_root/motion_blur -p SemKITTI_predictions/motion_blur --split valid

## Run evaluation script on wet ground data with fine-tuned model
python evaluate_iou.py -d ../Robo3D/create/semantickitti_c/save_root/wet_ground -p SemKITTI_predictions/wet_ground --split valid

## Run evaluation script on fog data with fine-tuned model
#python evaluate_iou.py -d ../Robo3D/create/semantickitti_c/save_root/fog -p SemKITTI_predictions/fog --split valid

## Run evaluation script on motion blur data with fine-tuned model
#python evaluate_iou.py -d ../Robo3D/create/semantickitti_c/save_root/motion_blur -p SemKITTI_predictions/motion_blur --split valid

conda deactivate

