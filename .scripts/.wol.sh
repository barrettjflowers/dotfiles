#!/bin/bash

# Replace this with the MAC address of the target device
# riverstone="c0:25:a5:bf:3e:bb"
# testbench="10:6f:d9:af:9d:eb" NOT PLUGGED INTO ETHERNET, TO USE PLUG INTO ETHERNET.
wildflower="D8:BB:C1:0D:31:29"

wakeonlan "$wildflower"
echo Waking up...
sleep 15
echo Connecting...
sleep 5
open "smb://barrett:*@192.168.149.165"
