#!/bin/bash
df | awk '{NF=NF-1}1' | column -t > /home/gutteridge/gites/devs/infoCPU.txt
echo "User:" >> /home/gutteridge/gites/devs/infoCPU.txt
hostname >> /home/gutteridge/gites/devs/infoCPU.txt
echo "CPU:" >> /home/gutteridge/gites/devs/infoCPU.txt
uname -snrv >> /home/gutteridge/gites/devs/infoCPU.txt
echo "Time:" >> /home/gutteridge/gites/devs/infoCPU.txt
date >> /home/gutteridge/gites/devs/infoCPU.txt

