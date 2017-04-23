#!/bin/bash
#
subread=input_files/*subreadset.xml
barode=barcodes.fasta
/home/ec2-user/smrtlink/smrtcmds/bin/pbsmrtpipe -e eid_subread:$subread -e eid_barcode:$barcode --preset-xml preset.xml 

