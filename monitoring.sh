#!/bin/bash

# Architecture of operating system and its kernel version
arch=$(uname -a)

# Number of physical processors (sockets)
physical_processors=$(lscpu | grep 'Socket' | awk '{print $2}')

# Number of virtual processors
virtual_processors=$(nproc)

wall "
#Architecture: $arch
#Number of physical processors: $physical_processors
#Number of virtual processors: $virtual_processors
"
