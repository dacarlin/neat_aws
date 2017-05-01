## AWS config for PacBio SMRTLink 

These two configs seem to work well: 

instance|cores|RAM|storage|price
--------|-----|---|-------|------
m4.2xlarge|8|32 GB|EBS|$0.431 per Hour 
m4.4xlarge|16|64 GB|EBS|$0.862 per Hour

You get however much storage you need with Elastic Block Storage (EBS), I used 100 GB for the single cell I was looking at. 

## Protocol captures 

I've tried the following protocols on two data sets. Data sets: 

- `/share/dnat/sequel/r54048_20170420_165522/5_E01`
- `/share/dnat/sequel/r54048_20160616_014950/1_A01`

and protocol captures: 

protocol capture|options|machine config|detail|run time|data set size
----------------|--------------|------|--------|--------------
`sa3_ds_barcode_laa`|max_phased_reads=500|m4.2xlarge|8 cores, 32 GB|12.45 min|14 GB
`sa3_ds_barcode_laa`|max_phased_reads=10000|m4.2xlarge|8 cores, 32 GB|34.23 min|14 GB
`sa3_ds_css`||m4.4xlarge|16 cores, 64 GB|64.90 min|3.9 GB

## Setting up SMRTLink on AWS instance  

Launch an EC2 instance with one of the configs above from the AWS console. Once it launches, note the public DNS or IP. You will create an AWS key file as part of launcing the instance. 

I saved my key file as "aws.pem". You need both the IP and the file to log in to the instance. As an example, to log in to a server with IP `54.163.152.2`, you can do 

```bash
ssh -i aws.pem ec2-user@54.163.152.153 
# note: not a real server
```

once logged in, you can download and install the SMRTLink software. 

## SMRTLink installation 

You can install SMRTLink right here in the home dir, in a directory called `smrt`. 

```bash
curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink_4.0.0.190159.zip
unzip -P SmrT3chN smrtlink_4.0.0.190159.zip
./smrtlink_4.0.0.190159.run --rootdir smrt 
``` 

All of the default options are fine (just press `Enter` throughout the script).

## Copy your data files to the instance 

Log in to Cabernet, and run copy your files up using a script like this 

```bash
scp -r -i aws.pem /share/dnat/sequel/r54048_20170420_165522/5_E01 ec2-user@54.163.152.153:input_files 
```

which will put the files on AWS in `/home/ec2-user/input_files`

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

In order to run the protocol, you need to generate the input files. To see the documentation and generate example input files, you can use the `pbsmrtpipe show-template-details` command. 

```bash 
pbsmrtpipe show-template-details pbsmrtpipe.pipelines.sa3_ds_barcode_laa -o config.xml
```

To run the pipeline, I created a short submit script. 

```bash
#!/bin/bash
pbsmrtpipe pipeline-id pbsmrtpipe.pipelines.sa3_ds_barcode_laa \
  -e eid_subread:subreadset.xml \
  -e eid_barcode:barcode.barcodeset.xml \
  --preset-xml config.xml \
  -o job_output_dir_name 
```
