spack install gcc@7.4.0%gcc@centos7_4.8.5
spack install petsc ~hdf5
spack install pumi@develop +shared +fortran +zoltan simmodsuite=full ^/z2g2n5c ^/3dnrzjl ^zoltan+parmetis

#gitr dependencies
spack install texinfo
spack load texinfo
spack install libconfig@1.7.1%gcc@7.4.0 ^/lw3xgcu ^/7c5liqe
spack install netcdf-cxx4@4.3.0%gcc@7.4.0 ^/lw3xgcu ^/n4jkbet ^netcdf@4.5.0
spack install thrust@1.8.2%gcc@7.4.0
spack install boost@1.61.0%gcc@7.4.0
