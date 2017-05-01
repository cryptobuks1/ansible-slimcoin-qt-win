# ansible-slimcoin-qt-win - Cross-compile Slimcoin-Qt for Windows

![](https://raw.github.com/slimcoin-project/ansible-slimcoin-qt-win/master/ansible-slimcoin.png)



Setup to create a Vagrant-hosted Ubuntu 16.04 VM, provisioned by Ansible and using MXE to cross-compile Windows binaries for Slimcoin:

```
deb http://pkg.mxe.cc/repos/apt/debian wheezy main
```

## Installation

### Vagrant

Install vagrant.


Deploy using [ansible](http://www.ansibleworks.com). (install instructions for ansible are in [requirements](#requirements) below.

```
ansible-playbook playbook.yml -i hosts
```

That's it. Now copy release/slimcoin-qt.exe to its intended location.


## Requirements

[Vagrant]() is required.



[Ansible](http://www.ansibleworks.com/) is required. 

### Installing Ansible

ppa:ansible/ansible

```
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
```

## History

Adapted from a contribution to Dogecoin.


### Supported Toolchains

Compiler and runtime: MinGW-w64.

    Target OS                   Packages
                          Static       Shared
    32 bit Windows  99% (379/381)   72% (273/381)
    64 bit Windows  94% (360/381)   71% (271/381)

These numbers were last updated on December 16, 2015. See the current status for individual packages.

Executables built for 32 bit Windows can be executed on 64 bit Windows as well.

How to choose MXE target:

If you want a 64 bit Windows executable, statically linked into one big executable: use MXE_TARGET x86_64-w64-mingw32.static;

If you want a 64 bit Windows executable, split into an executable and dependant dlls use MXE_TARGET x86_64-w64-mingw32.shared;

If you want a 32 bit Windows executable, statically linked into one big executable: use MXE_TARGET i686-w64-mingw32.static;

If you want a 32 bit Windows executable, split into an executable and dependant dlls use MXE_TARGET i686-w64-mingw32.shared.

Remark: The 'w64-mingw32' in those names are left-overs from historical evolutions in the open source cross-compilation world and refer in no way to the result being 64 or 32 bit Windows.


    gjh@ashpool:~/minkiz/fabshop/SlimCoinWork/slm-mxe-va-xcompile$ vagrant init geerlingguy/ubuntu1604
    gjh@ashpool:~/minkiz/fabshop/SlimCoinWork/slm-mxe-va-xcompile$ vagrant up
    Bringing machine 'default' up with 'virtualbox' provider...
    ==> default: Importing base box 'geerlingguy/ubuntu1604'...
    ==> default: Matching MAC address for NAT networking...
    ==> default: Checking if box 'geerlingguy/ubuntu1604' is up to date...
    ==> default: A newer version of the box 'geerlingguy/ubuntu1604' is available! You currently
    ==> default: have version '1.0.9'. The latest is version '1.1.3'. Run
    ==> default: `vagrant box update` to update.
    ==> default: Setting the name of the VM: slm-mxe-va-xcompile_default_1493570712322_44515
    ==> default: Clearing any previously set network interfaces...
    ==> default: Available bridged network interfaces:
    1) wlan0
    2) virbr0
    ==> default: When choosing an interface, it is usually the one that is
    ==> default: being used to connect to the internet.
        default: Which interface should the network bridge to? 1
    ==> default: Preparing network interfaces based on configuration...
        default: Adapter 1: nat
        default: Adapter 2: bridged
    ==> default: Forwarding ports...
        default: 22 (guest) => 2222 (host) (adapter 1)
    ==> default: Running 'pre-boot' VM customizations...
    ==> default: Booting VM...
    ==> default: Waiting for machine to boot. This may take a few minutes...
        default: SSH address: 127.0.0.1:2222
        default: SSH username: vagrant
        default: SSH auth method: private key
    ==> default: Machine booted and ready!
    ==> default: Checking for guest additions in VM...
    ==> default: Setting hostname...
    ==> default: Configuring and enabling network interfaces...
    ==> default: Mounting shared folders...
        default: /vagrant => /home/gjh/minkiz/fabshop/SlimCoinWork/slm-mxe-va-xcompile
    ==> default: Running provisioner: ansible...
        default: Running ansible-playbook...
    PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ControlMaster=auto -o ControlPersist=60s' ansible-playbook --connection=ssh --timeout=30 --limit="default" --inventory-file=/home/gjh/minkiz/fabshop/SlimCoinWork/slm-mxe-va-xcompile/.vagrant/provisioners/ansible/inventory -v provisioning/xcomp.yml
    Using /home/gjh/.ansible.cfg as config file

    PLAY [Slimcoin cross-compile] **************************************************
    skipping: no hosts matched

    PLAY RECAP *********************************************************************

---

    $host vagrant ssh

    $hosted ifconfig
    enp0s3    Link encap:Ethernet  HWaddr 08:00:27:6a:67:e6  
              inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
              inet6 addr: fe80::a00:27ff:fe6a:67e6/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:471 errors:0 dropped:0 overruns:0 frame:0
              TX packets:345 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:51405 (51.4 KB)  TX bytes:48778 (48.7 KB)
    
    enp0s8    Link encap:Ethernet  HWaddr 08:00:27:33:26:c6  
              inet addr:192.168.0.146  Bcast:192.168.0.255  Mask:255.255.255.0
              inet6 addr: fe80::a00:27ff:fe33:26c6/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:98 errors:0 dropped:0 overruns:0 frame:0
              TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:8046 (8.0 KB)  TX bytes:1332 (1.3 KB)
    
    lo        Link encap:Local Loopback  
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:65536  Metric:1
              RX packets:0 errors:0 dropped:0 overruns:0 frame:0
              TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1 
              RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
