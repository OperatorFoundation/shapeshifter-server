#!/bin/bash

if [ ! -f ~/.ssh/id_ecdsa ]; then
  ssh-keygen -t ecdsa -f ~/.ssh/id_ecdsa -N '' -q
fi
