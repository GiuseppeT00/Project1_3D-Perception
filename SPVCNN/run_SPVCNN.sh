#!/bin/sh

#SBATCH -J SPVCNN_testing_wet_ground_fine_tuned
#SBATCH -o ./SPVCNN_testing_wet_ground_fine_tuned_id%j.txt
#SBATCH --partition=gpu_guest
#SBATCH --qos=gpu_guest
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --gres=gpu:a100_hylab:1
#SBATCH --time=0-23:59:59
#SBATCH --mem=35G
##SBATCH --dependency=afterok:2040128

module load miniconda3
source "$CONDA_PREFIX/etc/profile.d/conda.sh"
module load gnu7
module load cuda/11.2
conda activate sphere_former

## Run training script
#python main.py --log_dir spvcnn-log \
#               --config config/SPVCNN-semantickitti.yaml \
#               --gpu 0 #\
#               #--checkpoint weights/last_classical_model.ckpt -> per riprendere l'addestramento dal ckpt

# Per il test, gli unici cambiamenti vengono fatti in semantic-kitti_test.yaml e SPVCNN-semantickitti_test.yaml
#python main.py --log_dir training_log --fine_tune \
#               --config config/SPVCNN-semantickitti_fine-tuning.yaml \
#               --gpu 0 \
#               --checkpoint weights/classical_model.ckpt

# Per il test, gli unici cambiamenti vengono fatti in semantic-kitti_test.yaml e SPVCNN-semantickitti_test.yaml
python main.py --log_dir test_log --test --num_vote=12 \
               --config config/SPVCNN-semantickitti_test.yaml \
               --gpu 0 \
               --checkpoint weights/fine_tuned_model.ckpt

conda deactivate
