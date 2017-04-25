## AWS config for PacBio SMRTLink 

instance|cores|RAM|storage|price
m4.4xlarge|16|64 GB|EBS|$0.862 per Hour

You get however much storage you need with Elastic Block Storage (EBS). 

Launch the instance from the console and note the public DNS or IP. You will, as part of launcing the instance, create an AWS key file (PEM). You'll need the IP and the file to log in. 

```bash
ssh -i aws.pem ec2-user@{amazon-dns}
```

once logged in, you can download and install the SMRTLink software. 

## SMRTLink installation 

You can just install SMRTLink right here in the home dir, in a directory called `smrt`. 

```bash
curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink_4.0.0.190159.zip
unzip -P SmrT3chN smrtlink_4.0.0.190159.zip
./smrtlink_4.0.0.190159.run --rootdir smrt 
``` 

All of the default options are fine (just press `Enter`). 

## Copy your data files to the instance 

Log in to Cabernet, and run copy your files up using a script like this 

```bash
scp -r -i aws.pem /share/dnat/sequel/r54048_20170420_165522/5_E01 ec2-user@{amazon-dns}:input_files 
```

which will put the files on AWS. The rest is all on AWS

## View available protocols 

To view and run protocols, we can use the `pbsmrtpipe` tool. Add this (and others) to `PATH`

```bash
export PATH=/home/ec2-user/smrt/smrtcmds/bin:$PATH
```

and have a look at the list of available protocols

```bash
pbsmrtpipe show-templates 
```

In my case, I was interested in the protocol `pbsmrtpipe.pipelines.sa3_ds_barcode_laa`. 

In order to run the protocol, you need to generate the input files. To pipe them to a file called "config.xml", you can use 

```bash 
pbsmrtpipe show-template-details pbsmrtpipe.pipelines.sa3_ds_barcode_laa -o config.xml
```

To run the pipeline, I created a short submit script. 

```bash
#!/bin/bash
pbsmrtpipe pipeline-id pbsmrtpipe.pipelines.sa3_ds_barcode_laa \
  -e eid_subread:{subreadset.xml} \
  -e eid_barcode:{barcode.barcodeset.xml} \
  --preset-xml config.xml
  -o job_output_dir_name 
```
