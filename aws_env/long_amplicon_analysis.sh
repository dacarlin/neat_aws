#!/bin/bash
pbsmrtpipe pipeline-id pbsmrtpipe.pipelines.sa3_ds_barcode_laa \
  -e eid_subread:input_files/*.subreadset.xml \
  -e eid_barcode:bc.barcodeset.xml \
  --preset-xml laa.xml \
  --preset-xml global.xml \
  -o job__laa_phase_cluster_off
