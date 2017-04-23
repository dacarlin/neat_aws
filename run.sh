#!/bin/bash
#

subread=`ls /home/ec2-user/input_files/*subreadset.xml`
barcode=/home/ec2-user/neat_aws/barcodes.fasta
preset=/home/ec2-user/neat_aws/preset.xml 

/home/ec2-user/smrtlink/smrtcmds/bin/pbsmrtpipe -e eid_subread:$subread -e eid_barcode:$barcode --preset-xml $preset

