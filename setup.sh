#!/bin/bash
TWEMOJI_VERSION=13.1.0

echo Installing dependencies
sudo apt-get update
sudo apt-get install fonttools fontforge python3-fontforge python3 python-is-python3 npm unzip zip
npm install

echo Cleaning up old versions
rm 72x72
rm -rf v*.zip
rm -rf twemoji-*.*.*

echo Downloading Twemoji
wget https://github.com/twitter/twemoji/archive/refs/tags/v$TWEMOJI_VERSION.zip
unzip v$TWEMOJI_VERSION.zip

# For < v13.0
# ln -s twemoji-$TWEMOJI_VERSION/2/72x72 72x72

# For > v13.0
ln -s twemoji-$TWEMOJI_VERSION/assets/72x72 72x72
