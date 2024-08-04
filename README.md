# Chivel

Kubernetes cluster on a bunch of Raspberry Pis, previously known as [fruitsap](https://github.com/minhtt159/fruitsap).

This repository is inspired by [onedr0p's cluster-template](https://github.com/onedr0p/cluster-template), but shaped for Raspberry Pis and Single-board computers.

## Hardware

| Name     | Model             | Storage       | Role   |
| -------- | ----------------- | ------------- | ------ |
| pi0      | VM 4cpu - 8GB     | 64GB          | Master |
| pi1      | RPI4-MODBP-8GB    | 64GB (USB)    | Master |
| pi2      | RPI4-MODBP-8GB    | 64GB (USB)    | Master |
| pi3      | RPI4-MODBP-8GB    | 64GB (USB)    | Worker |
| pi4      | RPI4-MODBP-8GB    | 64GB (USB)    | Worker |
| turing-1 | CM4108032         | 32GB (eMMC)   | Worker |
| turing-2 | CM4108032         | 32GB (eMMC)   | Worker |
| turing-3 | Turing RK1 - 32GB | 1024GB (NVME) | Worker |
| turing-4 | Turing RK1 - 32GB | 1024GB (NVME) | Worker |

## Disclaimer

1. This template is heavily invested in SBC hardware, so it might not work for all. The takeaways of this cluster are:

- Raspberry Pi 4
- Raspberry Pi CM4
- Turing Pi 2 cluster board
- Turing Pi RK1

2. Since Turing Pi RK1 only supports [Ubuntu 22.04 LTS Server](https://docs.turingpi.com/docs/turing-rk1-flashing-os#image-types-and-download-source) custom image, this cluster will use Ubuntu as the host OS.

3. Some useful features of this cluster template are:

- flux - GitOps platform
- cilium - Kubernetes CNI
- cert-manager - Certificates management
- cloudflared - Load balancer
- traefik - Ingress Controller
- ingress-nginx - Ingress Controller

# Chapter 1: Machine Preparation

See more in [Chapter 1 - Machine Preparation](./docs/Chap1.md)

# Chapter 2: Workstation Preparation

See more in [Chapter 2 - Prep Workstation](./docs/Chap2.md)

# Chapter 3: k3s

k3s is also opinionated. I'm using [Lens](https://github.com/lensapp/lens) from Mirantis so this would help with metrics and monitoring.

See more in [Chapter 3](./docs/Chap3.md)

# Chapter 4: TBD

```bash
task workstation:direnv
task workstation:brew
task workstation:env

task ansible:deps
task ansible:list
task ansible:ping
task ansible:run playbook=cluster-prepare
```
