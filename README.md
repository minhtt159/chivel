# Chivel

Opinionated Kuberenetes cluster on a bunch of Raspberry Pis.

Previously known as [fruitsap](https://github.com/minhtt159/fruitsap); but this time I want to learn for real.

This is a fork from [onedr0p's flux-cluster-template](https://github.com/onedr0p/flux-cluster-template).

Hardware:

| Name     | Model          | Storage     | Role   |
| -------- | -------------- | ----------- | ------ |
| pi0      | VM 4cpu-8GB    | 64GB        | Master |
| pi1      | RPI4-MODBP-8GB | 64GB (USB)  | Master |
| pi2      | RPI4-MODBP-8GB | 64GB (USB)  | Master |
| pi3      | RPI4-MODBP-8GB | 64GB (USB)  | Worker |
| pi4      | RPI4-MODBP-8GB | 64GB (USB)  | Worker |
| turing-1 | CM4108032      | 32GB (eMMC) | Worker |
| turing-2 | CM4108032      | 32GB (eMMC) | Worker |

# Chapter 1: HostOS & hardening

HostOS is completely opinionated. You can use Debian if you want, I use Ubuntu 22.04.3 LTS.

There are some caveat if you use different host OS; see original flux-cluster-template for more information.

See more at [Chapter 1](./docs/Chap1.md)

# Chapter 2: Prepare for k0s, Networking and Storage

See more at [Chapter 2](./docs/Chap2.md)

# Chapter 3: k0s

k0s is also opinionated. I'm using [Lens](https://github.com/lensapp/lens) from Mirantis so this would help for metrics and monitoring.

See more at [Chapter 3](./docs/Chap3.md)

# Chapter 4: TBD
