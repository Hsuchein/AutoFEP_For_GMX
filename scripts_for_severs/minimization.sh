echo "*******************************************************************"
echo "*************Auto-FEP Machine Part2 (Calculate Module)*************"
echo "************************Minimization Begins************************"
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
    echo "Windows$i Minimization has begun!"
    echo "Windows$i Minimization has begun!"
    echo "Windows$i Minimization has begun!"
    echo "Windows$i Minimization has begun!"
    echo "Windows$i Minimization has begun!"
    grofile=$(find . -maxdepth 1 -type f -name "*.gro" -print -quit)
    if [ -n "$grofile" ]; then
    # 变量非空的情况下执行的代码
    echo "grofile found: $grofile"
    echo "grofile found: $grofile"
    echo "grofile found: $grofile"

    gmx grompp -p topol.top -c $grofile -r $grofile -f min.mdp -maxwarn 100 -n complex.ndx -o min.tpr
    gmx mdrun -deffnm min
    cd ..
    echo "Windows$i Minimization has done!"
    echo "Windows$i Minimization has done!"
    echo "Windows$i Minimization has done!"
    echo "Windows$i Minimization has done!"
    echo "Windows$i Minimization has done!"
    else
    # 变量为空的情况下执行的代码
    echo "grofile not found, program will exit in 10 seconds"
    echo "grofile not found, program will exit in 10 seconds"
    echo "grofile not found, program will exit in 10 seconds"
    echo "grofile not found, program will exit in 10 seconds"
    echo "grofile not found, program will exit in 10 seconds"
    sleep 10
    exit 1
    fi
done
