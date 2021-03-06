#!/bin/bash
vendor=$( lspci -n -s $1 | cut -f3 -d ":" )
device=$( lspci -n -s $1 | cut -f4 -d ":" )
bdf=$1
echo "bdf: $bdf, vendor: $vendor, device: $device"

echo $bdf > /sys/bus/pci/devices/$bdf/driver/unbind
echo $vendor $device  > /sys/bus/pci/drivers/vfio-pci/new_id
echo $bdf  > /sys/bus/pci/drivers/vfio-pci/bind
