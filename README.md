# `neat_aws`

## Neat AWS config, workflow, pipline overview (4 steps)

1. launch EC2 instance 
2. install SMRTLink 
3. copy data 
4. run analysis 

### Launch and config an EC2 instance 

This one works well: m4.10xlarge (16 CPU, 64 GB RAM), and add 100 GB storage ($0.886 per hour). 

### Install SMRTLink 

First, download and unzip it 

```bash
curl -O https://downloads.pacbcloud.com/public/software/installers/smrtlink_4.0.0.190159.zip
unzip -P SmrT3chN smrtlink_4.0.0.190159.zip
```

Now you can install it right here (doesn't matter where) 

```bash
smrtlink_4.0.0.190159.run --rootDir smrtlink 
```

You will need to provide all the options. Most (all?) can be left as default. 

### Copy your data files to the instance 

```bash
scp -r -i aws.pem data_files ec2-user@54.89.153.29:
#ok to leave in the ec2-user home dir for now 
```


### Run the consensus with barcoding 

You can use the provided `preset.xml` (in this repo) and `sub.sh` in this repo
