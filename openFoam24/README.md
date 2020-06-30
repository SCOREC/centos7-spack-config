# erp-spack-config
CCI ERP spack configuration and scripts for building OpenFoam-org 2.4.0
with the GNU GCC compilers and OpenMPI.

## contents

compilers.yaml - compiler list

config.yaml - global config

modules.yaml - hierarchical layout for lua modules

packages.yaml - system installed packages

README.md - this file

setupSpack.sh - env needed for executing spack commands

spack.yaml - list of packages to install

## setup

```
git clone git@github.com:spack/spack.git spack
cd !$
git checkout v0.13.3
# create the environment
spack env create openFoam24
spack env activate openFoam24
# copy the yaml files into the openFoam24
cp /path/to/the/dir/with/the/yaml/files/* var/spack/environments/openFoam24
# copy the compiler yaml file into the spack etc dir
cp /path/to/the/dir/with/the/yaml/files/compilers.yaml etc/spack/.
```

## resuming work in an environment

```
source /gpfs/u/software/dcs-spack-src/dcs-spack-config/setupSpack.sh
spack env activate openFoam24
```

