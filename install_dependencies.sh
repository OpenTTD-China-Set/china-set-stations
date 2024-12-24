#!/bin/bash

# here I'm using ahyangyi's fork of gorender

export GOPATH=$PWD/gopath
go install github.com/ahyangyi/gorender/cmd@cdca513
mv gopath/bin/cmd gopath/bin/gorender

git clone https://github.com/openttd/nml.git
