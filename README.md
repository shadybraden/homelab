# This is my homelab

My current homelab is made up of a [mini PC](https://aoostar.com/products/aoostar-r1-2bay-nas-intel-n100-mini-pc-with-w11-pro-lpddr4-16gb-ram-512gb-ssd) running Debian, a Raspberry Pi 3, and pfsense firewall. The mini PC (named `holmie`) currently runs over 3 dozen docker containers. The Raspberry Pi (named `pi3`) runs 8, including Pi-Hole, Nginx, Wireguard and more.

More details found in the docker folder and under [Old Docker based homelab](#Old-Docker-based-homelab)

The goal is to take what I've learned from this and my knowlege of Kubernetes and combine these into a high availibility homelab using GitOps and version control to manage a new shiny cluster.

## Table of Contents

<details>

- [Hardware](#Hardware)

- [Kubernetes setup](#Kubernetes)

- [Old Docker based homelab](#Old-Docker-based-homelab)

</details>

## Hardware

The goal is to have 2x Mac Mini's running Fedora Server as k3s controllers, and 2x Intel N100 mini pc's running Fedora Server as worker nodes. 

Currently this is in [testing](#Non-HA-testing-and-config), and one [Mac Mini](https://support.apple.com/en-us/112588) is the controller, and a [Dell OptiPlex 7040](https://www.dell.com/support/manuals/en-us/optiplex-7040-desktop/opti7040mt_om-v1/specifications) with a i5-6500T as the worker.
    
## Kubernetes

### Goals

- HA k3s (mac minis as control plane and N100's as workers).
    - Basic [Mac Minis](https://support.apple.com/en-us/112588), and any N100 based computer.
    - OS's will be Fedora Server.
    - Storage will likely be managed via TrueNAS. I know I just said Fedora Server, but hear me out:
        - TrueNAS installed on bare metal. 2x large HDD's attached and put into a mirror in TrueNAS. Then a VM based on that to actually install k3s on.
        - This has 2 benifits: 1 - TrueNAS is good at Raid. 2 - TrueNAS has built in Restic and Rclone making backups super easy.
- GitOps via ArgoCD or Flux to this Repo.

### Non-HA testing and config

## Old Docker based homelab

This is currently running on an [N100 mini pc](https://aoostar.com/products/aoostar-r1-2bay-nas-intel-n100-mini-pc-with-w11-pro-lpddr4-16gb-ram-512gb-ssd).
This pc uses Debian and docker to deploy over 3 dozen services.
A raspberry pi is setup to run Pi-Hole as a DNS server and Nginx.

See the docker folder for more info.