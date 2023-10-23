#!/bin/sh

#SBATCH -J fog
#SBATCH -o ./fog_id%j.txt
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

python fog_simulation.py --root_folder ../../../../dataset/sequences --dst_folder  ../save_root/fog --inte_folder  integral_lookup_tables_seg_light_0.008beta --beta  0.008 --n_cpus 24 --sequences 08

#python fog_simulation.py --root_folder ../../../../dataset/sequences --dst_folder  ../save_root/fog --inte_folder  integral_lookup_tables_seg_light_0.008beta --beta  0.008 --n_cpus 24 --sequences 03 04 06

conda deactivate
