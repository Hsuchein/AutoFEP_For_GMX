echo "*******************************************************************"
echo "**************Auto-FEP Machine Part3 (Collect Module)**************"
echo "***************************DHDL Collect****************************"
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