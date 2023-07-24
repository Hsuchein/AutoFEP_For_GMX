echo "*******************************************************************"
echo "************Auto-FEP Machine Part2 (Calculate Module)**************"
echo "****************************NPT Begins*****************************"
echo "**********************Developed by Xvjian Wang*********************"
echo "*****************************2023/07/24****************************"
echo "*****************************GitHub Link***************************"
echo "************https://github.com/Hsuchein/AutoFEP_For_GMX************"
echo "*******************************************************************"
echo "                                           "
echo "                                           "
echo "                                           "
echo "                                           "
num_windows=10
i=0
for ((i=0; i<=num_windows; i++));do
    cd Windows$i
    if [ ! -f "min.gro" ]; then
        echo "File min.gro in Windows $i not found"
        echo "File min.gro in Windows $i not found"
        echo "This may mean minimization in Windows $i go error"
        sleep 10
    else
    gmx grompp -p topol.top -c min.gro -r min.gro -f npt.mdp -maxwarn 100 -n complex.ndx -o npt.tpr
    sleep 5
    sbatch -p gpu_c128  --gpus=1 npt.sh #If you are not using a server
                                    #you can replace this with your mdrun command
    sleep 3
    echo "*******************************************"
    echo "*******************************************"
    echo "***Windows $i NPT Mission Has Submitted****"
    echo "*******************************************"
    echo "*******************************************"
    fi
    cd ..
    sleep 1
done