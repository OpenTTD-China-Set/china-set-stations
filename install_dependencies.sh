#!/bin/bash

# here I'm using ahyangyi's fork of gorender

export GOPATH=$PWD/gopath
go install github.com/ahyangyi/gorender/cmd@daeb83b4
mv gopath/bin/cmd gopath/bin/gorender

# if you have grf-py installed you may want to use a venv

pip3 install nml==0.7.5
