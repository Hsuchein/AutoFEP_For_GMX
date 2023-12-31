echo "*******************************************************************"
echo "*************Auto-FEP Machine Part2 (Calculate Module)*************"
echo "*****************************MD Begins*****************************"
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
    if [ ! -f "npt.gro" ]; then
        echo "File npt.gro in Windows $i not found"
        echo "File npt.gro in Windows $i not found"
        echo "This may mean NPT in Windows $i go error"
        sleep 10
    else
    gmx grompp -p topol.top -c npt.gro -r npt.gro -f md.mdp -maxwarn 100 -n complex.ndx -o md.tpr
    sleep 5
    sbatch -p gpu_c128  --gpus=1 md.sh #If you are not using a server
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
