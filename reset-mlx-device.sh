#!/bin/bash
vendor=$( lspci -n -s $1 | cut -f3 -d ":" )
device=$( lspci -n -s $1 | cut -f3 -d ":" )
bdf=$1
echo "bdf: $bdf, vendor: $vendor, device: $device"

echo $bdf  > /sys/bus/pci/drivers/vfio-pci/unbind
echo $vendor $device  > /sys/bus/pci/drivers/vfio-pci/remove_id
echo $bdf > /sys/bus/pci/drivers/mlx5_core/bind
