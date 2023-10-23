#!/bin/sh

#SBATCH -J wet_ground
#SBATCH -o ./wet_ground_id%j.txt
#SBATCH --partition=cpu_guest
#SBATCH --qos=cpu_guest
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --time=0-23:59:59
#SBATCH --mem=86G


module load miniconda3
source "$CONDA_PREFIX/etc/profile.d/conda.sh"
module load gnu7
conda activate sphere_former

# python augmentation.py --root_folder ../../../../dataset/sequences --dst_folder  ../save_root/wet_ground --water_height  0.0002 --noise_floor  0.3 --n_cpus 24 --sequences 08

python augmentation.py --root_folder ../../../../dataset/sequences --dst_folder  ../save_root/wet_ground --water_height  0.0002 --noise_floor  0.3 --n_cpus 24 --sequences 03 04 06

conda deactivate
