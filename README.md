# This is my homelab

My current homelab is made up of a mini PC running Debian. However, it is an opinionated homelab and read more see below:

https://shadybraden.com/articles/gitopshomelab/

[my compose repo](https://github.com/shadybraden/compose)

## Kubernetes

***this is incomplete***

[convert compose.yaml to Kubernetes compatable](https://github.com/kubernetes/kompose)

### Goals

- HA k3s (mac minis as control plane and N100's as workers).
    - Basic [Mac Minis](https://support.apple.com/en-us/112588), and any N100 based computer.
    - OS's will be Fedora Server.
    - Storage will likely be managed via TrueNAS. I know I just said Fedora Server, but hear me out:
        - TrueNAS installed on bare metal. 2x large HDD's attached and put into a mirror in TrueNAS. Then a VM based on that to actually install k3s on.
        - This has 2 benifits: 1 - TrueNAS is good at Raid. 2 - TrueNAS has built in Restic and Rclone making backups super easy.
- GitOps via ArgoCD or Flux to this repo.
- Use the testing hardware below to setup a testing/staging environment, then make a production environment. 

### Non-HA testing and config

- install Ansible on `shadypc` (my desktop)
	- `sudo dnf install ansible -y` 
- use `k3s-ansible` to automate the install and setup of k3s
	- git clone [the repo](https://github.com/k3s-io/k3s-ansible) 
	- follow the [usage guide](https://github.com/k3s-io/k3s-ansible?tab=readme-ov-file#usage) 
		- set server host to controller0's ip and the agent to the worker0's ip
		- set token
	- `ansible-playbook playbooks/site.yml -i inventory.yml -kK`
	- update: `ansible-playbook playbooks/upgrade.yml -i inventory.yml -kK`
	- `sudo kubectl get nodes` from `controller0`.....eyyy all nodes there
		- in theory, add another node's ip to the inventory.yml and that should add it as a thing.
