#!/bin/bash
echo "IT IS PROTOTYPE VERSION, IF YOU HAVE ANY ISSUE, CONTACT TO US" 
echo "yondonjamts.ganzorig@gmail.com"
sleep 8
echo "You think Mr.Yondonjamts' awesome? [y,n]"
read ans
if [ "$ans" == "y" ] || [ "$ans" == "Y" ] || [ "$ans" == "yes" ] || [ "$ans" == "YES" ] || [ "$ans" == "Yes" ]; then
sudo add-apt-repository ppa:ettusresearch/uhd
sudo apt-get update
sudo apt-get -y install libuhd-dev libuhd003 uhd-host libboost-all-dev libusb-1.0-0-dev python-mako doxygen python-docutils cmake git swig cmake doxygen build-essential libboost-all-dev libtool libusb-1.0-0 libusb-1.0-0-dev libudev-dev libncurses5-dev libfftw3-bin libfftw3-dev libfftw3-doc libcppunit-1.13-0v5 libcppunit-dev libcppunit-doc ncurses-bin cpufrequtils python-numpy python-numpy-doc python-numpy-dbg python-scipy python-docutils qt4-bin-dbg qt4-default qt4-doc libqt4-dev libqt4-dev-bin python-qt4 python-qt4-dbg python-qt4-dev python-qt4-doc python-qt4-doc libqwt6abi1 libfftw3-bin libfftw3-dev libfftw3-doc ncurses-bin libncurses5 libncurses5-dev libncurses5-dbg libfontconfig1-dev libxrender-dev libpulse-dev swig g++ automake autoconf libtool python-dev libfftw3-dev libcppunit-dev libboost-all-dev libusb-dev libusb-1.0-0-dev fort77 libsdl1.2-dev python-wxgtk3.0 git-core libqt4-dev python-numpy ccache python-opengl libgsl-dev python-cheetah python-mako python-lxml doxygen qt4-default qt4-dev-tools libusb-1.0-0-dev libqwt5-qt4-dev libqwtplot3d-qt4-dev pyqt4-dev-tools python-qwt5-qt4 cmake git-core libxi-dev gtk2-engines-pixbuf r-base-dev python-tk liborc-0.4-0 liborc-0.4-dev libasound2-dev python-gtk2 libzmq-dev libzmq1 python-requests python-sphinx libcomedi-dev python-zmq
git clone --recursive git://github.com/EttusResearch/uhd.git
git clone --recursive git://github.com/gnuradio/gnuradio.git
cd uhd
git submodule init
git submodule --recursive update
cd host
mkdir build
cd build
cmake ../
make
make test
sudo make install
cd
cd gnuradio
git submodule init
git submodule --recursive update
mkdir build
cd build
cmake ../
make
make test
sudo make install
sudo ldconfig
echo "Congratulations, you've installed all you need ;)"
else
echo "Try again later :D"
fi
