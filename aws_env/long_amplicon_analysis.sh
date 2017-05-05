#!/bin/bash
pbsmrtpipe pipeline-id pbsmrtpipe.pipelines.sa3_ds_barcode_laa \
  -e eid_subread:input_files/m54048_160616_015450.subreadset.xml \
  -e eid_barcode:neat.barcodeset.xml \
  --preset-xml laa.xml \
  --preset-xml global.xml \
  -o job__laa_nophase_nocluster
