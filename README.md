# Chivel

Opinionated Kuberenetes cluster on a bunch of Raspberry Pis.

Previously known as [fruitsap](https://github.com/minhtt159/fruitsap); but this time I want to learn for real.

This is a fork from [onedr0p's cluster-template](https://github.com/onedr0p/cluster-template).

Hardware:

| Name | Model          | Storage    | Role   |
| ---- | -------------- | ---------- | ------ |
| pi0  | VM 4cpu-8GB    | 64GB       | Master |
| pi1  | RPI4-MODBP-8GB | 64GB (USB) | Master |
| pi2  | RPI4-MODBP-8GB | 64GB (USB) | Master |
| pi3  | RPI4-MODBP-8GB | 64GB (USB) | Worker |
| pi4  | RPI4-MODBP-8GB | 64GB (USB) | Worker |

<!-- | turing-1 | CM4108032      | 32GB (eMMC) | Worker | -->
<!-- | turing-2 | CM4108032      | 32GB (eMMC) | Worker | -->

# Chapter 1: Machine Preparation

Deviating from the original template, I'm using 4 Raspberry Pi 4 running Ubuntu 22.04.3 LTS, you can use Debian if you want. The HostOS is completely opinionated.

There are some caveat if you use different host OS; see original [cluster-template](https://github.com/onedr0p/cluster-template) for more information.

See more at [Chapter 1 - Machine Preparation](./docs/Chap1.md)

# Chapter 2: Workstation Preparation

See more at [Chapter 2 - Prep workstation](./docs/Chap2.md)

# Chapter 3: k3s

k3s is also opinionated. I'm using [Lens](https://github.com/lensapp/lens) from Mirantis so this would help for metrics and monitoring.

See more at [Chapter 3](./docs/Chap3.md)

# Chapter 4: TBD
