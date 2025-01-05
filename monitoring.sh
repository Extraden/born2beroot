#!/bin/bash

# Architecture of operating system and its kernel version
arch=$(uname -a)

# Number of physical processors (sockets)
physical_processors=$(lscpu | grep 'Socket' | awk '{print $2}')

wall "
#Architecture: $arch
#Number of psycical processors: $physical_processors
"
