#!/bin/bash
#centos-main vm
hostname=centos7-ks
VM_DISK=/root/Leon/QemuVM/rhcsa/vols
VM_NAME="centos7-ks"
virt-install --connect qemu:///system \
        --name "${VM_NAME}" \
        --location="http://centos7-main.raspi/centos7/" \
        --disk path="${VM_DISK}/centos7-ks.qcow2",size=15,bus=virtio,format=qcow2 \
        --memory=1048 \
        --noautoconsole \
        --graphics none \
        --os-variant "centos7.0" \
        --vcpus 2 \
        --cpu host \
        --os-type linux \
        --network network=br0,model=virtio \
        --console pty,target_type=serial \
        --extra-args "inst.ks=http://centos7-main/centos7/anaconda-ks.cfg inst.repo=http://centos7-main/centos7/ console=ttyS0,115200n8 serial SERVERNAME=${hostname}" \
        #--wait=-1
