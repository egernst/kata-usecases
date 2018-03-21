#!/bin/bash
vendor=$( lspci -n -s $1 | cut -f3 -d ":" )
device=$( lspci -n -s $1 | cut -f3 -d ":" )
bdf=$1
numVF=$2
echo "bdf: $bdf, vendor: $vendor, device: $device"
cat /sys/bus/pci/devices/$bdf/sriov_totalvfs
echo $numVF > /sys/bus/pci/devices/$bdf/sriov_numvfs
