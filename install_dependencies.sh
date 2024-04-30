#!/bin/bash

# here I'm using ahyangyi's fork of gorender

export GOPATH=$PWD/gopath
go install github.com/ahyangyi/gorender/cmd@daeb83b4
mv gopath/bin/cmd gopath/bin/gorender

# nml requires python to run
# here I merge two PRs to nml, #306 and #320
git clone https://github.com/openttd/nml.git
cd nml
git config user.name "anonymous"
git config user.email "anonymous@example.com"
git checkout 0.7.5
git remote add pr_source https://github.com/glx22/nml
git fetch pr_source layout_registers
git merge -X theirs pr_source/layout_registers -m "Merge layout_registers"
git fetch pr_source var6B
git merge -X theirs pr_source/var6B -m "Merge var6B"
rm -rf .git
