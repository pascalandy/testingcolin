set -e
DEBIAN_FRONTEND=noninteractive

DIR_PROJECT=gst2-base-0.11.2-colinmeinke

## https://github.com/colinmeinke/ghost-storage-adapter-s3
## npm info postinstall ghost-storage-adapter-s3@1.2.0
#
## GHOST_SOURCE="/usr/src/ghost"
## GHOST_CONTENT="/var/lib/ghost"
## WORKDIR $GHOST_SOURCE

echo && echo "START - runthis.sh" && sleep 1 && echo


### Install ghost-storage-adapter-s3@1.2.0 in $GHOST_CONTENT
npm install ghost-storage-adapter-s3
mkdir -p ./content/storage
cp -r ./node_modules/ghost-storage-adapter-s3 ./content/storage/s3
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


### Leave a trace on dockerbuild
ENV_DATE_SEC="$(date +%Y-%m-%d_%H-%M-%S -d  "5 hour ago")"
ENV_LOG="$DIR_PROJECT"_dockerbuild-log_"$ENV_DATE_SEC".txt
echo "Saving our: $ENV_LOG"
touch /"$ENV_LOG"
	echo && echo "Checkpoint 3" && sleep 1 && echo
	

echo && echo "END - runthis.sh" && sleep 1 && echo