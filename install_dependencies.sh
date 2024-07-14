#!/bin/bash

# here I'm using ahyangyi's fork of gorender

export GOPATH=$PWD/gopath
go install github.com/ahyangyi/gorender/cmd@daeb83b4
mv gopath/bin/cmd gopath/bin/gorender

# install python dependencies
pip3 install -r requirements.txt
# nml requires python to run
# here I merge two PRs to nml, #306 and #320

git clone https://github.com/openttd/nml.git
cd nml
git checkout 3739dd40029a3a61303f1d43529b4504b56348c5
