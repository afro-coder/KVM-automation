# Goals

1. Install Rocky Linux 
2. Update the system.
3. Install cloud-init, vim, tmux, vimrc configs.
4. Shutdown the VM and virt-sysprep it.

### Current Bottlenecks
1. Block Device takes time, experiment with the following

```code
COPYING THE BLOCK DEVICE
       Starting with an original guest, you probably wish to copy the guest block
       device and its configuration to make a template.  Then once you are happy
       with the template, you will want to make many clones from it.

                               virt-sysprep
                                    |
                                    v
        original guest --------> template ---------->
                                             \------> cloned
                                              \-----> guests
                                               \---->

       You can, of course, just copy the block device on the host using cp(1) or
       dd(1).

                          dd                 dd
        original guest --------> template ---------->
                                             \------> cloned
                                              \-----> guests
                                               \---->

       There are some smarter (and faster) ways too:

                                 snapshot
                       template ---------->
                                   \------> cloned
                                    \-----> guests
                                     \---->

       You may want to run virt-sysprep twice, once to reset the guest (to make a
       template) and a second time to customize the guest for a specific user:

                           virt-sysprep        virt-sysprep
                             (reset)      (add user, keys, logos)
                                |                   |
                        dd      v          dd       v
        original guest ----> template ---------> copied ------> custom
                                                 template       guest

```
Steps
