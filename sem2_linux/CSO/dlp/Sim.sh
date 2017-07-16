clear
cd ~

if [ -d Sim ]
then
  echo "Uninstalling..."
  rm -r Sim
fi

wget web.iiit.ac.in/~parth.kolekar/Sim.tar.gz && tar xvzf Sim.tar.gz && rm Sim.tar.gz && chmod +x ~/Sim/stdArchSim && ln ~/Sim/stdArchSim ~/bin/stdArchSim;
