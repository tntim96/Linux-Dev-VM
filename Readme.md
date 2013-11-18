Vagrant Linux Development VMs
=============================

Instructions for repeatable set-up of Linux VMs with multiple development kits with the following aims:
* Create Linux development environments (especially for Ruby where Windows support isn't so good).
* Maximise cross platform compatibility using puppet
* Minimise bandwidth by downloading and installing large binaries from the file-system (to be automated)
* Automate as much of the process as possible

Supported Linux VMs
* Ubuntu 64 (working)
* Centos 64 (TODO)
* Other (TODO)

Development kits:
* Java (working)
* NodeJS (TODO)
* Ruby (TODO)

Setting up the environment
--------------------------
* Install Virtual Box and Vagrant
* Download `precise64.box` to `<PROJECT-ROOT>/boxes/`
* Edit `<PROJECT-ROOT>/Ubuntu64/Vagrant`, property `test_vm.vm.box_url` to point to `precise64.box`
* Download `jdk-<version>-linux-x64.tar.gz` (e.g. jdk-7u45-linux-x64.tar.gz) to `<PROJECT-ROOT>/shared_pkg/`
* Change directory to Ubuntu64
* Run `vagrant up`

Puppet and Java
---------------
http://pensieve.info/blog/2013/09/21/install-java-on-vm-using-vagrant-and-puppet/

VT-x/AMD-V hardware acceleration...
-----------------------------------
If you get the following error:
```
VT-x/AMD-V hardware acceleration has been enabled, but is not operational. Your 64-bit guest will fail to detect a 64-bit CPU and will not be able to boot.

Please ensure that you have enabled VT-x/AMD-V properly in the BIOS of your host computer.
```
...you may need to enable this setting in your BIOS. For Windows 8, see [this blog](http://naushad.me/amd-v-hardware-acceleration-has-been-enabled-but-is-not-operational-virtualbox/) for instructions.

