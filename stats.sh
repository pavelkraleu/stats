#!/bin/bash

# Chrome

chrometabs=`ps aux | grep chrome | grep renderer | wc -l`

# Memory

memtotal=`free | grep 'Mem' | awk '{print($2)}'`
memused=`free | grep 'Mem' | awk '{print($3)}'`
memfree=`free | grep 'Mem' | awk '{print($4)}'`
membuffer=`free | grep 'Mem' | awk '{print($6)}'`
memcached=`free | grep 'Mem' | awk '{print($7)}'`

# Battery

energynow=`cat /sys/class/power_supply/BAT0/energy_now`
energyfull=`cat /sys/class/power_supply/BAT0/energy_full`
energycycles=`cat /sys/class/power_supply/BAT0/cycle_count`
energyvoltage=`cat /sys/class/power_supply/BAT0/voltage_now`

# System Load

load=`cat /proc/loadavg | awk '{print($1)}'`

# Timestamp

timestamp=`date +%s`

# Uptime

uptime=`cat /proc/uptime | awk '{print($1)}'`

echo "$timestamp $uptime $memtotal $memused $memfree $membuffer $memcached $chrometabs $energynow $energyfull $energycycles $energyvoltage $load" >> /var/stats

