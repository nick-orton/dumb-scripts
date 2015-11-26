#!/bin/sh

# This is a script to mount a usb-stick.  This works when the stick is placed
# in the top usb slots. 

OWNER=no
MOUNT_POINT=/mnt/stick

# TODO:
# if cmd line arg is used, mount that partition
# If not, show the partitions in da0

if [ ! -e /dev/da0 ]; then
  echo "USB Drive does not seem to be plugged in"
  exit 0
fi

if [ -z  $1 ]; then
  echo "Need to specify which partition to mount"
  echo "Partition table for /dev/da0:"
  gpart show /dev/da0
  exit 1
elif [ ! -e /dev/da0s$1 ]; then
  echo "could not find Usb Drive at /dev/da0s$1"
  exit 0
else 
  sudo mkdir -p $MOUNT_POINT
  sudo mount_msdosfs -u $OWNER /dev/da0s$1 $MOUNT_POINT     
  exit 0
fi

