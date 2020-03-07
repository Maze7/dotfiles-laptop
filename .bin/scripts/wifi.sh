#!/bin/bash
sudo ip link set wlp4s0 down
sudo netctl stop-all
sudo systemctl restart netctl
