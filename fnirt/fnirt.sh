#!/bin/bash

. /etc/fsl/5.0/fsl.sh
for p in 14
do
  export VFC_BACKENDS="libinterflop_mca.so -p ${p}"
  for i in `seq 1` 
  do
    echo $p $i
    ${FSLDIR}/bin/fnirt --in=fnirt_input_image.nii.gz --ref=MNI152_T1_1mm.nii.gz \
                        --iout=fnirt-${i}-p${p}.nii.gz --fout=warp-fnirt-${i}-p${p}.nii.gz
  done
done
