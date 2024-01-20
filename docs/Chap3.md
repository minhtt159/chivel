# k0s

## Initial setup

Create nessesary files:

```bash
task init
```

Fill in the form [config.yaml](./bootstrap/vars/config.yaml) & [addons.yaml](./bootstrap/vars/addons.yaml).

Create age secret key:

```bash
task sops:age-keygen
```

Create Cloudflare API Token with these permissions:

```
Zone - DNS - Edit
Account - Cloudflare Tunnel - Read
```

Create Cloudflare Tunnel with these commands

```bash
cloudflared tunnel login
cloudflared tunnel create chivel
cat ~/.cloudflared/*.json
```
