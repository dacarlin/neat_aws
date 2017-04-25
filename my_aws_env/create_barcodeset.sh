#!/bin/bash
export PATH=/home/ec2-user/smrt/smrtcmds/bin:$PATH
dataset create --generateIndices --name neat --type BarcodeSet neat.barcodeset.xml bc.fasta 
