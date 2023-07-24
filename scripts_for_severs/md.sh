#!/bin/bash
#SBATCH --job-name=_NAME_
module load cuda/11.1
module load gcc/9.3
export PATH=/HOME/scz0bvi/run/software/gromacs-2023/build/bin:$PATH
gmx  mdrun -v -deffnm md -ntmpi 1 -ntomp 6 -pin on -dhdl dhdl._STATE_.xvg

