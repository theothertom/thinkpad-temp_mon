#!/bin/bash
temp=`grep temp /proc/acpi/ibm/thermal | awk '{print $2}'`
if [ ! -f /var/run/temp_mon.state ] ; then
    echo auto > /var/run/temp_mon.state
fi
state=`cat /var/run/temp_mon.state`
if [ $temp -gt 80 ]; then
    echo -n 'level disengaged' > /proc/acpi/ibm/fan
    if [ $state != "disengaged" ]; then
        logger "Fan state changed to disengaged"
        echo disengaged > /var/run/temp_mon.state
    fi
else
    echo -n 'level auto' > /proc/acpi/ibm/fan
    if [ $state != "auto" ]; then
        logger "Fan state changed to auto"
        echo auto > /var/run/temp_mon.state
    fi
fi
