#!/bin/bash
pbsmrtpipe pipeline-id pbsmrtpipe.pipelines.sa3_ds_barcode_ccs \
  -e eid_subread:input_files/*.subreadset.xml \
  -e eid_barcode:bc.barcodeset.xml \
  --preset-xml ccs.xml \
  --preset-xml global.xml \
  -o job__ccs
