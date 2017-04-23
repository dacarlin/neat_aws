#!/bin/bash

/home/ec2-user/smrtlink/smrtcmds/bin/pbsmrtpipe \
	pipeline-id pbsmrtpipe.pipelines.sa3_ds_ccs \
	-e eid_subread:/home/ec2-user/input_files/m54048_170422_091135.subreadset.xml \
	--preset-xml task.xml \
	--preset-xml global.xml \
	-o ../out_css
