#!/bin/bash

#if [ ! -f ~/.ssh/id_ed25519 ]; then
#  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N '' -q
#fi

if [ ! -f ~/.ssh/id_ecdsa ]; then
  ssh-keygen -t ecdsa -f ~/.ssh/id_ecdsa -N '' -q
fi
