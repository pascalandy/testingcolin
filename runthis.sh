set -e
DEBIAN_FRONTEND=noninteractive

# This shall use source build-config.sh ($ENV_IMG_NAME)
DIR_PROJECT=gst2-s3

## https://github.com/colinmeinke/ghost-storage-adapter-s3
## npm info postinstall ghost-storage-adapter-s3@1.2.0
#
## GHOST_SOURCE="/usr/src/ghost"
## GHOST_CONTENT="/var/lib/ghost"
## WORKDIR $GHOST_SOURCE

echo && echo "START - runthis.sh" && sleep 1 && echo


### Install ghost-storage-adapter-s3@1.2.0 in $GHOST_CONTENT
cd $GHOST_SOURCE
npm install ghost-storage-adapter-s3
mkdir -p ./content/storage
cp -r ./node_modules/ghost-storage-adapter-s3 ./content/storage/s3
ln -s /usr/src/ghost/core /var/lib/core
pwd
	echo && echo "Checkpoint 1"  && sleep 1 && echo


### Install other stuff
#apt-get update -q
#apt-get upgrade -qy
#apt-get install -qy \
	#wget
#apt-get clean
#apt-get autoremove
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	echo && echo "Checkpoint 2" && sleep 1 && echo


### Leaving a trace on dockerbuild
ENV_DATE_SEC="$(date +%Y-%m-%d_%H-%M-%S -d  "5 hour ago")"
ENV_LOG="$DIR_PROJECT"_dockerbuild-log_"$ENV_DATE_SEC".txt
touch /"$ENV_LOG"
echo "Leaving a trace on dockerbuild: $ENV_LOG"
	echo && echo "Checkpoint 3" && sleep 1 && echo


echo && echo "END - runthis.sh" && sleep 1 && echo