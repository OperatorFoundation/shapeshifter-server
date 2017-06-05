#!/bin/bash

apt-get install -y git golang curl supervisor

mkdir ~/go
export GOPATH=~/go
go get -u github.com/OperatorFoundation/shapeshifter-dispatcher/shapeshifter-dispatcher
