sleep 30
df -h > /home/gutteridge/gites/devs/infoCPU.txt
echo "User:" >> /home/gutteridge/gites/devs/infoCPU.txt
hostname >> /home/gutteridge/gites/devs/infoCPU.txt
echo "CPU:" >> /home/gutteridge/gites/devs/infoCPU.txt
lscpu >> /home/gutteridge/gites/devs/infoCPU.txt
#uname -r
#cat /proc/version
echo "Time:" >> /home/gutteridge/gites/devs/infoCPU.txt
date >> /home/gutteridge/gites/devs/infoCPU.txt
sleep 10

