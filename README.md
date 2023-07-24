# AutoFEP_For_GMX
English:
In the field of molecular dynamics, scholars are well aware that free energy calculations are extremely useful tools, holding significant importance in areas such as drug design and analysis of interactions in large biomolecules. Free Energy Perturbation (FEP) is currently recognized as the most accurate method for computing free energy in the classical physics domain (of course, we should exclude quantum chemistry when discussing this matter), and Gromacs has long supported FEP calculations.

Although Gromacs has greatly reduced our workload, the batch processing procedures required for FEP remain quite complex. Recently, my work specifically demands FEP implementation based on GMX. As a result, I have written some shell scripts here to facilitate the use of GMX for batch processing FEP calculations. These scripts include those designed for server-based computations (utilizing the slurm scheduling system) and for personal computers. However, I have yet to test the scripts for personal computers, so if any issues arise, please feel free to contact me.

Chinese:
在分子动力学领域的学者都知道，自由能计算是一项非常有用的工具，它在药物设计、生物大分子相互作用分析等领域具有非常重要的地位。而自由能微扰（FEP）则是在经典物理领域（当然我们应该抛开量子化学去谈这件事）目前公认的最准确的计算自由能的方法，而Gromacs很早就实现了FEP的计算。虽然Gromacs为我们降低了很大的工作量，但是FEP所需要的批处理流程依旧十分繁杂，并且我最近的工作又恰好需要基于GMX实现的FEP，所以我在这里写了一些shell脚本来方便大家使用GMX做批处理的FEP计算。其中包括基于服务器的运算脚本（基于slurm调度系统）和基于个人电脑的脚本，但个人电脑脚本我尚未测试，如果出现问题请与我联系。
