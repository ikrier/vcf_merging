#!/bin/bash

arg=$1
name=${arg%gz}ot.gz
zcat $1|sed  '11 i\##FILTER=<ID=off_target,Description="Filtered due to being off target of haloplex design">' |sed '11 i\##FILTER=<ID=homopolymer_region,off_target,Description="Filtered because in homopolymer region and off target">' |sed  '11 i\##FILTER=<ID=low_coverage,off_target,Description="Filtered due to being off target of haloplex design and low coverage">'|sed -r 's/homopolymer_region,off_target/homopolymer_regionANDoff_target/g'|sed -r 's/low_coverage,off_target/low_coverageANDoff_target/g'|bgzip >$name
