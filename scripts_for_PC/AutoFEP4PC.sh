echo "*******************************************************************"
echo "*************Auto-FEP Machine Part1 (Generator Module)*************"
echo "*************************Preparation Begins************************"
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
    if [ ! -d "Windows$i" ]; then
        mkdir Windows$i
    fi
    cp *.mdp *.gro *.itp *.ndx *.top *.sh ./Windows$i
    cp -r *.ff ./Windows$i

    sed -i "s/_STATE_/ $i /g" "./Windows$i/md.mdp"
    sed -i "s/_STATE_/ $i /g" "./Windows$i/npt.mdp"
    sed -i "s/_STATE_/ $i /g" "./Windows$i/min.mdp"
    sed -i "s/_STATE_/$i/g" "./Windows$i/md.sh"
    sed -i "s/_NAME_/NPT_$i/g" "./Windows$i/npt.sh"
    sed -i "s/_NAME_/MD_$i/g" "./Windows$i/md.sh"
    echo "Windows $i is done"
done

echo "*******************************************************************"
echo "*************Auto-FEP Machine Part2 (Calculate Module)*************"
echo "************************Minimization Begins************************"
echo "*******************************************************************"
sleep 5

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

echo "*******************************************************************"
echo "************Auto-FEP Machine Part2 (Calculate Module)**************"
echo "****************************NPT Begins*****************************"
echo "*******************************************************************"
sleep 5

for ((i=0; i<=num_windows; i++));do
    cd Windows$i
    if [ ! -f "min.gro" ]; then
        echo "File min.gro in Windows $i not found"
        echo "File min.gro in Windows $i not found"
        echo "This may mean minimization in Windows $i goes error"
        sleep 10
    else
    gmx grompp -p topol.top -c min.gro -r min.gro -f npt.mdp -maxwarn 100 -n complex.ndx -o npt.tpr
    sleep 5
    gmx mdrun -v -deffnm npt -pin on #You can customize commands for optimal efficiency
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

echo "*******************************************************************"
echo "*************Auto-FEP Machine Part2 (Calculate Module)*************"
echo "*****************************MD Begins*****************************"
echo "*******************************************************************"
sleep 5

for ((i=0; i<=num_windows; i++));do
    cd Windows$i
    if [ ! -f "npt.gro" ]; then
        echo "File npt.gro in Windows $i not found"
        echo "File npt.gro in Windows $i not found"
        echo "This may mean NPT in Windows $i goes error"
        sleep 10
    else
    gmx grompp -p topol.top -c npt.gro -r npt.gro -f md.mdp -maxwarn 100 -n complex.ndx -o md.tpr
    sleep 5
    gmx mdrun -v -deffnm md -pin on -dhdl dhdl.$i.xvg #You can customize commands for optimal efficiency
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

echo "*******************************************************************"
echo "**************Auto-FEP Machine Part3 (Collect Module)**************"
echo "***************************DHDL Collect****************************"
echo "*******************************************************************"
sleep 5

if [ -d "DHDL_FILES" ]; then
    cd DHDL_FILES
    rm -rf *
    cd ..
else
    mkdir DHDL_FILES
fi

for ((i=0; i<=num_windows; i++));do
    cd Windows$i
    if [ -f "dhdl.$i.xvg" ]; then
        if [ ! -f "md.gro" ]; then
            echo "In Windows$i,MD may have not been done!"
            echo "In Windows$i,MD may have not been done!"
            echo "In Windows$i,MD may have not been done!"
            sleep 2
        fi
        cp ./dhdl.$i.xvg ../DHDL_FILES
        echo "DHDL file in Windows$i has been collected"
    else
        echo "In Windows$i, I dont find DHDL file,please check the Simulation!"
        echo "In Windows$i, I dont find DHDL file,please check the Simulation!"
        echo "In Windows$i, I dont find DHDL file,please check the Simulation!"
        sleep 5
    fi
    cd ..
done

echo "Data collecting has been done!"
echo "Data collecting has been done!"
echo "Data collecting has been done!"
