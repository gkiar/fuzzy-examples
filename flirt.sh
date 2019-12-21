#!/bin/bash

. /etc/fsl/5.0/fsl.sh
for p in 14 19 20
do
  export VFC_BACKENDS="libinterflop_mca.so -p ${p}"
  for i in 1 2 3 
  do
    ${FSLDIR}/bin/flirt -in test2.nii.gz -ref MNI152_T1_1mm.nii.gz -o test2-flirt-${i}-p${p}.nii.gz -omat test2-flirt-${i}-p${p}.nii.gz
  done
done
