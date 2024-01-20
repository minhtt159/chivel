# Chapter 2: Prepare for k0s, Networking and Storage

## Prep workstation

Using go-task to install tools from Brew. See [Taskfile.yml](../.taskfiles/workstation/Taskfile.yml)

Tools and reason why we need it:

1. [Age](https://github.com/FiloSottile/age): Encryption tool for secrets, we will use it to encrypt our secrets before pushing to git.
2. [Cloudflared](https://github.com/cloudflare/cloudflared): Pre-configure Cloudflare network for k0s cluster.
3. Direnv: TBD
4. [Flux](https://github.com/fluxcd/flux2): GitOps tool, keep our cluster in sync with git.
5. [Go-task](https://github.com/go-task/task): Task runner, we will use it to run Taskfile.yml.
6. Helm: TBD
7. [jq](https://github.com/jqlang/jq): JSON processor.
8. k0sctl: TBD
9. [kubeconform](https://github.com/yannh/kubeconform): Validate Kubernetes YAML files against Kubernetes schemas.
10. [kubernetes-cli](https://kubernetes.io/docs/reference/kubectl): Just kubectl.
11. [kustomize](https://github.com/kubernetes-sigs/kustomize): Decorate Kubernetes YAML files; do I need this? or should I go with Terraform?
12. [moreutils](https://joeyh.name/code/moreutils/): Collection of tools that nobody thought to write when UNIX was young.
13. [Sops](https://github.com/getsops/sops): Used with Age to encrypt secrets.
14. [Stern](https://github.com/stern/stern): Tail multiple pods on Kubernetes and multiple containers within the pod.
15. [yq](https://github.com/mikefarah/yq): YAML processor.

Install with go-task:

```bash
task workstation:brew
```

## Networking

I'm using managed switch (UDM) for all the nodes, so I can use static IP on switch level instead of setting static IP on each node.

It's recommended to put the cluster into separate VLAN, it's also personal preference.

## Storage

I have a separate TrueNAS server for storage, so I'm using NFS for storage class.

TODO: Configure NFS on TrueNAS with ACL.
