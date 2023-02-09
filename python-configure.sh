if [ -x /usr/bin/python3 ]; then
	echo "Python is installed"
else
	echo "Python is not installed"
	echo "Installing Python"
	apt-get install python3
fi

apt-get install pip3
pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install --upgrade wheel
pip3 install --upgrade virtualenv

pip3 install matplotlib numpy scipy pandas