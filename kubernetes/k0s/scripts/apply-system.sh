#!/usr/bin/env bash
set -e
set -o noglob

[ $(id -u) -eq 0 ] || exec sudo $0 $@

K0S_HOSTNAME="$1"

# Prepare
sudo apt-get update -y

# Hostname
if [ -n "${K0S_HOSTNAME}" ] && [ "$(hostnamectl hostname)" != "${K0S_HOSTNAME}" ]; then
    hostnamectl set-hostname "${K0S_HOSTNAME}"
cat >/etc/hosts <<EOF
127.0.0.1 localhost
127.0.1.1 $K0S_HOSTNAME
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters
EOF
fi

# Timezone
timedatectl set-timezone "Europe/Amsterdam"

# Install Packages
apt-get install -y --no-install-recommends \
    apt-transport-https ca-certificates conntrack curl dirmngr gdisk gnupg hdparm htop \
    iptables iputils-ping ipvsadm libseccomp2 lm-sensors net-tools nfs-common \
    nvme-cli open-iscsi parted psmisc python3 python3-apt python3-kubernetes python3-yaml \
    smartmontools socat software-properties-common unzip util-linux

# Update DNS
chattr -i /etc/resolv.conf
rm -f /etc/resolv.conf
cat >/etc/resolv.conf <<EOF
search .
nameserver 1.1.1.1
EOF
chattr +i /etc/resolv.conf

# Kernel Modules
for module in br_netfilter ceph ip_vs ip_vs_rr nbd overlay rbd; do
    if ! test -f /etc/modules-load.d/$module.conf; then
        echo $module > /etc/modules-load.d/$module.conf
    fi
done
systemctl restart systemd-modules-load.service

# Sysctls
cat >/etc/sysctl.d/99-kubernetes.conf <<EOF
fs.inotify.max_queued_events = 65536
fs.inotify.max_user_watches = 524288
fs.inotify.max_user_instances = 8192
EOF
sysctl -p /etc/sysctl.d/99-kubernetes.conf

# Disable swap
swapoff -a

# Disable AppArmor
if systemctl is-enabled apparmor.service; then
    systemctl mask apparmor.service
fi

# Create containerd config
mkdir -p /etc/k0s/containerd.d
cat >/etc/k0s/containerd.d/default.toml <<EOF
[plugins."io.containerd.grpc.v1.cri"]
  enable_unprivileged_ports = true
  enable_unprivileged_icmp = true
[plugins."io.containerd.grpc.v1.cri".registry]
  config_path = "/var/lib/k0s/containerd/certs.d"
[plugins."io.containerd.grpc.v1.cri".containerd]
  discard_unpacked_layers = false
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
  discard_unpacked_layers = false
EOF
