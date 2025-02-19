# This is my homelab (in progress)

## Table of Contents:
<details>

- [Hardware](#Hardware)

- Kubernetes setup

- Old Docker based homelab
</details>

## Hardware

The goal is to have 2x Mac Mini's running Fedora Server as k3s controllers, and 2x Intel N100 mini pc's running Fedora Server as worker nodes. 

Currently this is intesting, and one Mac mini is the controller, and a Dell OptiPlex 7040 with a i5-6500T as the worker.
    
## Kubernetes

- k3s installed via [k3s Ansible](https://github.com/k3s-io/k3s-ansible)
- todo:
    - install first thing
    - setup load balancer
    - setup automatic ssl certs with lets encrypt and traefik

## Old Docker based homelab

This is currently running on an N100 mini pc.
This pc uses Debian and docker to deploy over 2 dozen services.
A raspberry pi is setup to run Pi-hole as a DNS server and Nginx.
