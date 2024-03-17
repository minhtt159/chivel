# Chapter 1: HostOS & Hardening

## HostOS

All nodes are running Ubuntu 22.04.3 LTS. I was trying to use netboot.xyz but it didn't work, so I had to install it manually.

You can use Rasberry Pi Imager to flash the USB/SSD to Ubuntu; or use any other tools.

## Hardening

After installing Ubuntu, update/upgrade everthing (even bootloader) and set **static IP** for all nodes.

I would like to harden a little bit more, so TBD

## Extra headers

Before running Cilium on Ubuntu 22.04 on a Raspberry Pi, please make sure to install the following package ([source](https://docs.cilium.io/en/stable/operations/system_requirements/#ubuntu-22-04-on-raspberry-pi)):

```bash
sudo apt install linux-modules-extra-raspi
```

I would like to install this package via ansible, but it's for another day
