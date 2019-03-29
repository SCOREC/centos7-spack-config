# centos7-spack-config
centos7 spack configuration and scripts

The `install.sh` script maintained in this repo is for documentation purposes (e.g., in case we had to reinstall the entire stack from scratch) and should not be executed as it will not use all of our existing package installs.  More discussion of package installation is below.

## useful commands

regenerate lmod module tree:

```
spack module lmod refresh
```

## installing new packages

Our spack repo is tracking the master spack branch.  Spack package updates could result in additional installation of packages with little or no package source code changes.  These additional installs can be avoided when installing new packages by first examining the output of the `spack spec -I` command.  If a utility/infrastructure level package, such as cmake or mpich, is marked with a `[+]` symbol in the leftmost column then it means that the existing install will be used.  If spack does not default to using the existing install you can append the hash of the package to the spec command.  

For example, lets see what happens when we ask for a pumi install using gcc 7.3.0

```
$ spack spec -I pumi@develop%gcc@7.3.0
Input spec
--------------------------------
 -   pumi@develop%gcc@7.3.0

Concretized
--------------------------------
 -   pumi@develop%gcc@7.3.0 build_type=RelWithDebInfo ~fortran~shared simmodsuite=none ~zoltan arch=linux-rhel7-x86_64 
[+]      ^cmake@3.13.1%gcc@7.3.0~doc+ncurses+openssl+ownlibs~qt arch=linux-rhel7-x86_64 
[+]          ^ncurses@6.1%gcc@7.3.0~symlinks~termlib arch=linux-rhel7-x86_64 
[+]              ^pkgconf@1.5.4%gcc@7.3.0 arch=linux-rhel7-x86_64 
[+]          ^openssl@1.1.1%gcc@7.3.0+systemcerts arch=linux-rhel7-x86_64 
[+]              ^perl@5.16.3%gcc@7.3.0+cpanm patches=0eac10ed90aeb0459ad8851f88081d439a4e41978e586ec743069e8b059370ac +shared+threads arch=linux-rhel7-x86_64 
[+]              ^zlib@1.2.11%gcc@7.3.0+optimize+pic+shared arch=linux-rhel7-x86_64 
 -       ^mpich@3.3%gcc@7.3.0 device=ch3 +hydra netmod=tcp +pmi+romio~verbs arch=linux-rhel7-x86_64 
[+]          ^findutils@4.6.0%gcc@7.3.0 patches=84b916c0bf8c51b7e7b28417692f0ad3e7030d1f3c248ba77c42ede5c1c5d11e,bd9e4e5cc280f9753ae14956c4e4aa17fe7a210f55dd6c84aa60b12d106d47a2 arch=linux-rhel7-x86_64 
[+]              ^autoconf@system%gcc@7.3.0 arch=linux-rhel7-x86_64 
[+]              ^automake@system%gcc@7.3.0 arch=linux-rhel7-x86_64 
[+]              ^libtool@system%gcc@7.3.0 arch=linux-rhel7-x86_64 
[+]              ^m4@1.4.16%gcc@7.3.0 patches=c0a408fbffb7255fcc75e26bd8edab116fc81d216bfd18b473668b7739a4158e +sigsegv arch=linux-rhel7-x86_64 
[+]              ^texinfo@6.5%gcc@7.3.0 arch=linux-rhel7-x86_64
```

Spack wants to install mpich 3.3, but we don't want to change to the new mpich version yet.  So, we will get the hash of the existing mpich 3.2.1 install:

```
$ spack find -ldv mpich%gcc@7.3.0
==> 1 installed package
-- linux-rhel7-x86_64 / gcc@7.3.0 -------------------------------
niuhmad    mpich@3.2.1 device=ch3 +hydra netmod=tcp +pmi+romio~verbs
```

then append the hash `niuhmad` to the spec for pumi using the `^` syntax to specify it as a dependency:

```
$ spack spec -I pumi@develop%gcc@7.3.0 ^/niuhmad
Input spec
--------------------------------
 -   pumi@develop%gcc@7.3.0
[+]      ^mpich@3.2.1%gcc@7.3.0 device=ch3 +hydra netmod=tcp +pmi+romio~verbs arch=linux-rhel7-x86_64 

Concretized
--------------------------------
 -   pumi@develop%gcc@7.3.0 build_type=RelWithDebInfo ~fortran~shared simmodsuite=none ~zoltan arch=linux-rhel7-x86_64 
[+]      ^cmake@3.13.1%gcc@7.3.0~doc+ncurses+openssl+ownlibs~qt arch=linux-rhel7-x86_64 
[+]          ^ncurses@6.1%gcc@7.3.0~symlinks~termlib arch=linux-rhel7-x86_64 
[+]              ^pkgconf@1.5.4%gcc@7.3.0 arch=linux-rhel7-x86_64 
[+]          ^openssl@1.1.1%gcc@7.3.0+systemcerts arch=linux-rhel7-x86_64 
[+]              ^perl@5.16.3%gcc@7.3.0+cpanm patches=0eac10ed90aeb0459ad8851f88081d439a4e41978e586ec743069e8b059370ac +shared+threads arch=linux-rhel7-x86_64 
[+]              ^zlib@1.2.11%gcc@7.3.0+optimize+pic+shared arch=linux-rhel7-x86_64 
[+]      ^mpich@3.2.1%gcc@7.3.0 device=ch3 +hydra netmod=tcp +pmi+romio~verbs arch=linux-rhel7-x86_64 
```

And see that in the Concretized spec it is now using the existing mpich 3.2.1 install.

## contents

compilers.yaml - compiler list
config.yaml - global config
install.sh - package installation commands
modules.yaml - hierarchical layout for lua modules
packages.yaml - system installed packages
README.md - this file
setupSpack.sh - env needed for executing spack commands
