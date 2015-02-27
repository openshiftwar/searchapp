#!/bin/sh
find $OPENSHIFT_PRIMARY_CARTRIDGE_DIR/logs/ -name "*.log*" -mtime +7 -type f -exec rm {} \;