nano /etc/netplan/00-installer-config.yaml                    

network:
  ethernets:
    enp0s3:
      addresses:
      - 192.168.1.100/24
      gateway4: 192.168.1.1
      nameservers:
        addresses:
        - 8.8.8.8
  version: 2
 
 sudo netplan apply (щоб застосувати)
