#!/bin/bash
virt-install --connect qemu:///system \
        --name "${VM_NAME}" \
        --disk "${VM_DISK_PATH}",target.bus=virtio \
        --boot hd \
        --memory=1048 \
        --noautoconsole \
        --graphics none \
        --os-variant "${VM_OS_VARIANT}" \
        --vcpus 2 \
        --cpu host \
        --os-type linux \
        --network network=br0,model=virtio \
        --console pty,target_type=serial
        #--extra-args "console=ttyS0,115200n8 serial" \
        #--wait=-1
