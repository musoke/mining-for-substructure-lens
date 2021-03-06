#!/bin/bash

#SBATCH --job-name=slr-c
#SBATCH --output=log_calibrate.log
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32GB
#SBATCH --time=7-00:00:00

source activate lensing
base=/scratch/jb6504/recycling_strong_lensing/
cd $base

python -u calibrate.py alices_full_grid alices_calibrate_full --dir $base --bins 20 --name 20bins
python -u calibrate.py alices_full_grid alices_calibrate_full --dir $base --bins 40 --name 40bins
python -u calibrate.py alices_full_grid alices_calibrate_full --dir $base --bins 60 --name 60bins
python -u calibrate.py alices_full_grid alices_calibrate_full --dir $base --bins 20 -s --name 20sbins
python -u calibrate.py alices_full_grid alices_calibrate_full --dir $base --bins 40 -s --name 40sbins
python -u calibrate.py alices_full_grid alices_calibrate_full --dir $base --bins 60 -s --name 60sbins
