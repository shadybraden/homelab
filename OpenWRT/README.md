# OpenWRT

## Setup

So this is a little cursed...

The idea is to use my OpenWRT One and make it a docker host for Pi-hole+DNSCrypt

Now, we will be storage limited reallllllly fast, so lets start there.

For me, I'm trying this on a `ext4` formatted thumb drive, and most instructions will be from here: https://openwrt.org/docs/guide-user/storage/usb-drives-quickstart

```shell
apk update
apk add block-mount e2fsprogs kmod-usb-storage-uas kmod-usb3 luci-app-hd-idle kmod-fs-ext4 lsblk
```

Then run `lsblk` to see disks. You should see a new entry. For me, I see `/dev/sda` and `/dev/sda1`

Go to "[mounts](https://192.168.50.1/cgi-bin/luci/admin/system/mounts) in the web-ui, find "Mount Points" then click "Add".

- Select the UUID that matches with `/dev/sda1` 
- Choose the mount point. We want docker images and volumes to live on this drive, so type in `/opt`
- Save!
- Apply and Save!
- Make a backup: https://192.168.50.1/cgi-bin/luci/admin/system/flash

## Docker time!

If pulling an image fails, try manually pulling with `docker pull` this has worked for me...

```shell
apk update
apk add dockerd docker docker-compose luci-app-dockerman git git-http
cd /opt
mkdir config_storage
cd config_storage
git clone http://192.168.50.65:3333/shady/compose.git
cd compose/openwrt
```

Now make your `.env`'s, and add the password to pihole and the onboarding key to periphery.

Pihole needs one more thing. `dnsmasq` is using port 53 but is also DHCP. If you arent using it for DHCP, then just stop and disable it. But I am, so I will simply move dnsmasq's dns forwarder to a different port; `53530`:

```shell
uci set dhcp.@dnsmasq[0].port=53530
uci commit dhcp
/etc/init.d/dnsmasq restart
```

Check that nothing is using port 53:

`netstat -ltnup | grep :53`

## Troubleshooting:

inter-docker internet access needs `network_mode: host`

# Edit DNS in Luci:

- Network>Interfaces>`wan` Edit>Advanced Settings>Use custom DNS servers>`192.168.50.1` 
- Network>Interfaces>`lan` Edit>Advanced Settings>Use custom DNS servers>`192.168.50.1` 
- Network>Interfaces>`lan` Edit>DHCP Settings>DHCP-Options>`6,192.168.50.1` 
- Save & Apply
- Make a backup: https://192.168.50.1/cgi-bin/luci/admin/system/flash
