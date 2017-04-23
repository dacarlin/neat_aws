# `neat_aws`

## Neat AWS config, workflow, pipline 

1. launch EC2 instance 
2. install SMRTLink 
3. copy data 
4. run analysis 

### Launch and config an EC2 instance 

This one works: m3.2xlarge (8 CPUs, X GB ram, 2 x 80GB SSD instance storage) 

### Copy your data files to the instance 

```bash
scp -r -i aws.pem data_files ec2-user@54.89.153.29:
#ok to leave in the ec2-user home dir for now 
```

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

### Run the consensus with barcoding 

You can use the provided `preset.xml` (in this repo) and `sub.sh` in this repo
