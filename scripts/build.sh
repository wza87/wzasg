#!/bin/sh

echo "#################################################################"
echo "This Script will pull latest code from git"
echo "and build spring boot application"
echo "#################################################################"

echo "#################################################################"
echo "Checking for build lock file"
echo "#################################################################"

date_time=$(date "+%Y-%m-%d %H:%M:%S")
lock_file=/opt/wzasg/scripts/.build_lock
if [ -e $lock_file ]
then
  echo "[$date_time] : Previous process still running, exit..."
  exit 0;
else
  echo "[$date_time] : Lock File checking done. Proceed..."
  echo "[$date_time] : $$" > $lock_file
fi

echo "#################################################################"
echo "Removing old files in target folder"
echo "#################################################################"
rm -rf /opt/wzasg/target

echo "#################################################################"
echo "Pulling Changes from GIT branch"
echo "#################################################################"
cd /opt/wzasg
git checkout master
git pull origin

echo "#################################################################"
echo "Building Spring boot application"
echo "#################################################################"
cd /opt/wzasg
mvn clean install

# remove lock file
rm $lock_file
