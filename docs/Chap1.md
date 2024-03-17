# Chapter 1: Machine Preparation

## System requirements

> [!Note]
>
> 1. All nodes are able to run workloads, including the controller nodes. I'm not rich enough to run separated controller nodes. Worker nodes are optional.
> 2. It's recommended to make 3 controller nodes for HA control plane.
> 3. This cluster is meant to be the controller Kubernetes cluster / homelab master cluster, so everything inside is generic.

| Role             | Cores     | Memory         | System Disk                |
| ---------------- | --------- | -------------- | -------------------------- |
| Control          | 4 _(6\*)_ | 8GB _(24GB\*)_ | 100GB _(500GB\*)_ SSD/NVMe |
| Worker           | 4 _(6\*)_ | 8GB _(24GB\*)_ | 100GB _(500GB\*)_ SSD/NVMe |
| _\* recommended_ |

## HostOS

All nodes are running Ubuntu 22.04.3 LTS. I was trying to use netboot.xyz but it didn't work, so I had to install it manually.

You can use Rasberry Pi Imager to flash the USB/SSD to Ubuntu; or use any other tools.

### Ubuntu (Raspberry Pi - arm64)

<details>
  <summary><i>Click <b>here</b> to read about using a Raspberry Pi</i></summary>

> [!NOTE]
>
> 1. It is recommended to have an 8GB RasPi model. Most important is to **boot from an external SSD/NVMe** rather than an SD card. This is [supported natively](https://www.raspberrypi.com/documentation/computers/raspberry-pi.html), however if you have an early model you may need to [update the bootloader](https://www.tomshardware.com/how-to/boot-raspberry-pi-4-usb) first.
> 2. Check the [power requirements](https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#power-supply) if using a PoE Hat and a SSD/NVMe dongle.

1. Use RasPi Imager Tool to flash Ubuntu Server 22.04 LTS

- If you can plug USB/NVME to host machine to flash directly
- Apply user as your liking, by default, it's root; I will create `pi` user, with ssh_key in known_hosts

Then, follow the rest

</details>

### Ubuntu (AMD64)

1. Download Ubuntu ISO and flash to the node/VMs

2. [Post install] Remove CD/DVD as apt source

```bash
su -
sed -i '/deb cdrom/d' /etc/apt/sources.list
apt update
exit
```

3. [Post install] Enable sudo for non-root user

```bash
su -
apt update
apt install -y sudo
usermod -aG sudo ${username}
echo "${username} ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/${username}
exit
newgrp sudo
sudo apt update
```

4. [Post install] Add SSH keys

```bash
mkdir -m 700 ~/.ssh
sudo apt install -y curl
curl https://github.com/${github_username}.keys > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

## Hardening

After installing Ubuntu, update/upgrade everthing (even bootloader) and set **static IP** for all nodes.

I would like to harden a little bit more, so TBD.

## Extra headers

Before running Cilium on Ubuntu 22.04 on a Raspberry Pi, please make sure to install the following package ([source](https://docs.cilium.io/en/stable/operations/system_requirements/#ubuntu-22-04-on-raspberry-pi)):

```bash
sudo apt install linux-modules-extra-raspi
```

I would like to install this package via ansible, but it's for another day.
