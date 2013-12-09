#!/bin/bash

set -e

echo "Updates packages. Asks for your password."
sudo yum update -y

echo "\nInstall Python"
#sudo yum install python -y

echo "\nInstall pip"
#sudo yum install python-pip -y

# echo "\nInstall WebApp2"
# sudo pip install webapp2>=2.5.1

# echo "\nInstall Paste"
# sudo pip install Paste>=1.7.5

# echo "\nInstall WebOb"
# sudo pip install WebOb>=1.2.3
#sudo yum install python-webob -y

echo "Install Twisted"
#sudo pip install python-twisted>=13.2.0
#sudo yum install python-twisted

echo -e "\n- - - - - -\n"
echo -e "Now we are going to print some information to check that everything is done:\n"

if bash -c 'python --version' 2>/dev/null ; then
	echo "Python is installed"
else
	echo "Python is not installed...installing..."
	sudo yum install python -y
	
fi

if bash -c 'pip --version' 2>/dev/null; then
	echo "pip is installed"
else
	echo "pip is not installed...installing..."
	sudo yum install python-pip -y
fi

if [  !`python -c "import webapp2;webapp2.__version__"` ]; then
	echo "WebApp2 is installed"
else
	echo "WebApp2 is not installed...installing..."
	sudo pip install webapp2
fi

if [  !`python -c "import paste;"` ]; then
	echo "Paste is installed"
else
	echo "Paste is not installed"
	sudo pip install Paste
fi

if [ !`python -c "import webob;"` ]; then
	echo "WebOb is installed"
else
	echo "WebOb is not installed...installing..."
	sudo pip install WebOb
fi

if [ !`python -c "import twisted;twisted.version"` ]; then
	echo "Twisted is installed"
else
	echo "Twisted is not installed ...installing..."
	sudo pip install python-twisted
fi
echo -e "\n- - - - - -\n"

echo "If the versions match, everything is installed correctly. If the versions 
don't match or errors are shown, something went wrong with the automated process 
and we will help you do the installation the manual way at the event.

Congrats!"
                                                                                 
