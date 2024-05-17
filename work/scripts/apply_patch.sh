#!/bin/bash

if [ ! -e lib ]
then
	echo "Run this from program root"
	exit
fi

tar xvf work/patch.tar.bz2
