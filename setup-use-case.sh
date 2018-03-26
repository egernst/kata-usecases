# Create VFs (reset them first)
sudo ./set-num-vfs.sh 0000:82:00.0 0
sudo ./set-num-vfs.sh 0000:82:00.0 2

# setup mac addresses:
sudo ip link set 0000:82:00.0 vf 0 mac 00:11:22:33:44:02
sudo ip link set 0000:82:00.0 vf 1 mac 00:11:22:33:44:03

# bind to VFIO so we can setup the VMs
sudo ./setup-device-for-vfio.sh 0000:82:00.2
sudo ./setup-device-for-vfio.sh 0000:82:00.3
