#!/bin/sh
#
# Script to install node JS, ERS dependencies, and the actual ERS code.
#

# Get the needed parameters
OS=sunos
ARCH=x86
VER=4.1.1
NODE_JS=http://nodejs.org/dist/v$VER/node-v$VER-$OS-$ARCH.tar.gz

# Download and extract needed node JS
which node
if [ $? != 0 ]; then 
    echo "Node.js DOES NOT exists.... Installing Node.js first...." 

    wget $NODE_JS 

    # Next, execute the following command to install the Node.js binary package in /usr/local/:
    tar zxf node-v$VER-$OS-$ARCH.tar.gz -C /usr/local --strip-components 1 
    if [ $? != 0 ]; then echo 'Node.js: INSTALLATION FAILED! Please see errors below:'; exit 1; fi
    
    echo "Node.js: SUCCESSFUL INSTALLATION!" 

    
else
    echo "Node.js already exists" 
fi 

# Install dependencies
echo 'Installing NPM evowebservices...'
npm install --save https://github.com/EvoStream/evowebservices/tarball/develop
if [ $? != 0 ]; then echo 'Evowebservices: INSTALLATION FAILED! Please see errors below:'; exit 1; fi

echo "Evowebservices: SUCCESSFUL INSTALLATION!" 

# Change to where evowebservices is
cd node_modules/evowebservices

# Start evowebservices
echo 'Starting EVOWEBSERVICES...'
npm start 
if [ $? != 0 ]; then echo 'Could not start EVOWEBSERVICES!'; exit 1; fi

exit 0;
