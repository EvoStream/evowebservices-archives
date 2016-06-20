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
curl $NODE_JS | tar xzf - --strip-components=1
if [ $? != 0 ]; then echo "Could not download node binary: $NODE_JS!"; exit 1; fi

# Install dependencies
echo 'Installing NPM evowebservices...'
npm install --save https://github.com/EvoStream/evowebservices/tarball/master
if [ $? != 0 ]; then echo 'Could not install ERS!'; exit 1; fi

# Change to where evowebservices is
cd ../node_modules/evowebservices

echo 'Installing pm2...'
npm install pm2 -g
if [ $? != 0 ]; then echo 'Could not install pm2!'; exit 1; fi

# Start evowebservices
echo 'Starting EVOWEBSERVICES...'
pm2 start app.js
if [ $? != 0 ]; then echo 'Could not start ERS!'; exit 1; fi

exit 0
