#!/bin/bash
virt-install --connect qemu:///system \
        --name "${VM_NAME}" \
        --location="http://medusa-arch:8000/" \ # Location for the disk online
        --disk path="${VM_DISK_PATH}",size=${VM_DISK_SIZE},bus=virtio,format=qcow2 \
        --memory=1048 \
        --noautoconsole \
        --graphics none \
        --os-variant "${VM_OS_VARIANT}" \
        --vcpus 2 \
        --cpu host \
        --os-type linux \
        --network network=br0,model=virtio \ # Modify according to your needs
        --console pty,target_type=serial \
        --extra-args "console=ttyS0,115200n8 serial" \ # You can also specify a kickstart file
        # --extra-args "ks=http://cento7-main/centos7/anaconda-ks.cfg console=ttyS0,115200n8 serial" \
        #--wait=-1
