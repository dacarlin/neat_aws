#!/bin/bash

cd analysis_results 
for i in ?_??.fasta; do clustalo -i $i > ${i/./_aln.}; done
for j in ?_??_aln.fasta; do cons -i $j > ${j/_aln/_aln_cons.fasta}; done 
cd .. 
