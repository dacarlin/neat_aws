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
./smrtlink_4.0.0.190159.run --rootdir smrtlink 
```

You will need to provide all the options. Most (all?) can be left as default. 

### Copy your data files to the instance 

Log in to Cabernet, and run copy your files up using a script like this 

```bash
scp -r -i aws.pem /share/dnat/sequel/r54048_20170420_165522/5_E01 ec2-user@{amazon-dns}:input_files 
```

which will put the files on AWS. 

### Run the consensus with barcoding 

```bash
mkdir output_files 
sudo yum install git 
git clone https://github.com/dacarlin/neat_aws.git
cd neat_aws 
bash run.sh
```
