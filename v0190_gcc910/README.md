environment for FEP22 class

## environment installation

These instructions were not tested - they are an approximate sequence of
commands to create the mfem+pumi+simmetrix installs

```
git clone -b cws/fep6 https://github.com/scorec/spack.git
git am /path/to/this/dir/*.patch
export SPACK_ROOT=$PWD
export PATH=$SPACK_ROOT/bin:$PATH
source $SPACK_ROOT/share/spack/setup-env.sh
mkdir v0190_gcc910
spack env create -d v0190_gcc910
spack env activate $_
cp /path/to/this/dir/ v0190_gcc910/
spack concretize -f #carefully check the output!
spack install
#create module files for system/external packages
spack module lmod refresh
```

