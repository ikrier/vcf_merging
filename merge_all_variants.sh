#!/bin/bash

#for file in `ls *.vcf`; do bgzip $file; done
for file in `ls *.vcf.ot.gz` ; do name=${file%gz}srt.gz;vcf-sort $file | bgzip >$name; done
for file in `ls *.vcf.ot.srt.gz`; do echo $file; name=${file%%.*};bcftools index $file; done
bcftools merge *.srt.gz|grep -v contig |bgzip >bcf_merged.vcf.gz


