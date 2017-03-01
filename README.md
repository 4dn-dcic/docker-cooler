# Docker-cooler


Data-type-independent, generic bam sorting module
* Input : a pairs file (.gz, along with .px2), chrom.size file
* Output : a contact matrix file (.cool)


This repo contains the source files for a docker image stored in duplexa/cooler:v2. (we will change the docker hub account soon)


## Cloning the repo
```
git clone https://github.com/4dn-dcic/docker-cooler
cd docker-cooler
```

## Resources tools
Major software tools used inside the docker container are downloaded by the script `downloads.sh`. This script also creates a symlink to a version-independent folder for each software tool. In order to build an updated docker image with a new version of the tools, ideally only `downloads.sh` should be modified, but not `Dockerfile`, unless the new tool requires a specific APT tool that need to be downloaded. 
The `downloads.sh` file also contains comment lines that specifies the name and version of individual software tools.


## Building docker image
You need docker daemon to rebuild the docker image. If you want to push it to a different docker repo, replace duplexa/cooler:v2 with your desired docker repo name. You need permission to push to duplexa/cooler:v2.
```
docker build -t duplexa/cooler:v2 .
docker push duplexa/cooler:v2
```

## Usage
Run the following in the container.
```
run.sh <input_pairs> <chromsize> <binsize> <output_prefix> <max_iter>
# input_pairs : a pairs file
# chromsize : a chromsize file
# binsize : binsize in bp
# output_prefix : prefix of the output cool file
# max_iter : max number of iteration (default is 200)
```
