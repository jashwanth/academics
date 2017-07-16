MobileSim -m Map.map -r amigo --start 0,0,0.0 1>/dev/null 2>&1 &
echo "MobileSim Started"
export LD_LIBRARY_PATH=/usr/local/Aria/lib/:$LD_LIBRARY_PATH
locate lib > /dev/null #to ensure that mobilesim gets started and then the program is called.
./botconnector
#kill `ps -C MobileSim -o pid --no-heading` #comment this line if you don't want to kill Mobilesim in the end.
