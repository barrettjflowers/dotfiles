#!/bin/bash

# Replace this with the MAC address of the target device
# linuxbox="c0:25:a5:bf:3e:bb"
wildflower="D8:BB:C1:0D:31:29"

wakeonlan "$wildflower"
echo Waking up...
sleep 25
echo Connecting...
sleep 10
open "smb://barrettjflowers:password@192.168.149.165/"
