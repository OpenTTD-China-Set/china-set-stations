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
git checkout f00eefa0434751ae669fb153f147e79420e35a5a
