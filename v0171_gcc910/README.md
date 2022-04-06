environment for installing mfem with pumi and simmetrix

## environment installation

```
git clone -b v0.17.1 https://github.com/spack/spack.git spack_v0171
cd $_
git am /path/to/this/dir/*.patch
export SPACK_ROOT=$PWD
export PATH=$SPACK_ROOT/bin:$PATH
source $SPACK_ROOT/share/spack/setup-env.sh
mkdir v0171_gcc910
spack env create -d v0171_gcc910
spack env activate $_
cp /path/to/this/dir/ $_/.
spack concretize -f #carefully check the output!
spack install
#create module files for system/external packages
spack module lmod refresh
```

