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
git config user.name "anonymous"
git config user.email "anonymous@example.com"
git checkout 522d1bc6a4f631e1d2f18d05ed5abb2fc8f8f494
git remote add pr_source https://github.com/glx22/nml
git fetch pr_source layout_registers
git merge -X ours pr_source/layout_registers -m "Merge layout_registers"
git fetch pr_source var6B
git merge -X ours pr_source/var6B -m "Merge var6B"
