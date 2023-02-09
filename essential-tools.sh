echo "Installing essential tools..."
apt-get install axel aria2 

echo "Installing apt-fast..."
add-apt-repository ppa:apt-fast/stable
apt-get update && sudo apt-get upgrade
apt-get -y install apt-fast

apt-fast install gcc g++ make git vlc pip vim neofetch cpufetch htop texlive-full

neofetch
cpufetch

git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq
./auto-cpufreq-installer
cd ..

cp .clang-format ~/.clang-format