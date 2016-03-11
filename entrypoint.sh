#!/bin/bash
set -e

chown -R shockpot:shockpot /opt/shockpot/log
chown shockpot:shockpot /opt/shockpot/shockpot.conf

su -c 'authbind --deep python /opt/shockpot/shockpot.py > /opt/shockpot/log/shockpot.out 2> /opt/shockpot/log/shockpot.err' shockpot

