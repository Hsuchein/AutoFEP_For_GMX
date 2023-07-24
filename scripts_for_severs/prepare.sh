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