thinkpad-temp_mon
=================

Monitor the temperature of a Thinkpad and adjust the fan if needed

Install
-------

Copy temp_mon.sh to /usr/local/bin
Make /usr/local/bin/temp_mon.sh executable (chmod +x)_
Copy temp_mon.cron to /etc/cron.d/temp_mon

Put the following lines in /etc/rc.local
    rmmod thinkpad_acpi
    modprobe thinkpad_acpi fan_control=1

Test
----

You should be able to test by doing somethink like

    watch cat /proc/acpi/ibm/thermal

and in another terminal

    yes > /dev/null &
    yes > /dev/null &
    yes > /dev/null &
    yes > /dev/null &

The script should run every five mins, and set the fan faster if the 
CPU temparature is over 80C
