#!/bin/sh
LOCKFILE=/tmp/javalock
if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then
    echo "already running"
    exit
fi

# make sure the lockfile is removed when we exit and then claim it
trap "rm -f ${LOCKFILE}; exit" INT TERM EXIT
echo $$ > ${LOCKFILE}

# do stuff
status=`ps -efww | grep -w "java" | grep -v grep | grep -v $$ | awk '{ print $2 }'`
if [ -z "$status" ]; then
    /usr/bin/gear start
fi

rm -f ${LOCKFILE}