#!/bin/bash

# Architecture of operating system and its kernel version
arch=$(uname -a)

# Number of physical processors (sockets)
physical_processors=$(lscpu | grep '^Socket(s):' | awk '{print $2}')

# Number of virtual processors
virtual_processors=$(nproc)

# RAM usage
used_ram=$(free -m | grep '^Mem:' | awk '{print $3}')
total_ram=$(free -m | grep '^Mem:' | awk '{print $2}')
used_ram_percentage=$((used_ram * 100 / total_ram))

# Disk usage
disk_used=$(df -m --total | awk '/^total/ {print $3}')
total_disk=$(df -m --total | awk '/^total/ {print $2}')
disk_usage_percentage=$((disk_used * 100 / total_disk))
wall "
#Architecture: $arch
#CPU physical: $physical_processors
#vCPU: $virtual_processors
#Memory Usage: $used_ram MB / $total_ram MB ($used_ram_percentage%)
#Disk Usage: $disk_used MB / $total_disk MB ($disk_usage_percentage%)
"
