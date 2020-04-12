#!/bin/sh
apt update
apt install -y ruby-full ruby-bundler build-essential
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
