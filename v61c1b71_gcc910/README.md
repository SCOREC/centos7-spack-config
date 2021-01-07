environment for FEP21 class

## environment installation

```
git clone https://github.com/spack/spack.git
cd spack
git checkout 61c1b71
git checkout -b v61c1b71_gcc910
git am /path/to/this/dir/*.patch
export SPACK_ROOT=$PWD
export PATH=$SPACK_ROOT/bin:$PATH
source $SPACK_ROOT/share/spack/setup-env.sh
spack env create v61c1b71_gcc910
spack env activate $_
cp /path/to/this/dir/ var/spack/environments/v61c1b71_gcc910
spack concretize -f #carefully check the output!
spack install
#create module files for system/external packages
spack module lmod refresh
```

