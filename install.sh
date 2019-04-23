spack install gcc@7.4.0%gcc@centos7_4.8.5
spack install mpich%gcc@7.4.0 +verbs +slurm pmi=pmi
spack install pumi@develop +shared +fortran +zoltan simmodsuite=full ^/z2g2n5c ^/3dnrzjl ^zoltan+parmetis ^simmodsuite@12.0-190413
