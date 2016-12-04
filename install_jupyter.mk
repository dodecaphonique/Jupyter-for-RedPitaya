all	: install_python3 install_pip3 install_autotools install_libsodium install_zeromq install_jupyter

install_python3 :
	apt-get -y install python3
	apt-get -y install python3-dev
  
install_pip3  :
	apt-get -y install python3-setuptools
	easy_install3 pip
	mv /usr/local/bin/pip /usr/local/bin/pip-3

install_autotools :
	apt-get -y install libtool pkg-config build-essential autoconf automake
  
install_libsodium :
	git clone git://github.com/jedisct1/libsodium.git
	cd libsodium; ./autogen.sh; ./configure && make check; make install
	ldconfig
  
install_zeromq  :
	wget http://download.zeromq.org/zeromq-4.1.4.tar.gz
	tar -xvf zeromq-4.1.4.tar.gz
	cd zeromq-4.1.4; ./autogen.sh; ./configure && make check;  make install
	ldconfig
  
install_jupyter :
	pip3 install jupyter
  
  

