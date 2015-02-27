#!/bin/sh
dodeploy=$(curl -Ls http://os-manager.appspot.com/wardeploy)
if [ "$dodeploy" -eq "1" ]
then
        if [ -d "$OPENSHIFT_JBOSSEAP_DIR" ];
        then
                DIR=$OPENSHIFT_JBOSSEAP_DIR
        else
                DIR=$OPENSHIFT_JBOSSAS_DIR
        fi
        wget -q https://dl.dropboxusercontent.com/s/pxoiqim3hlhhh2a/BingSearchonAppfog.war -O $DIR/standalone/deployments/BingSearchonAppfog.war
        touch $DIR/standalone/deployments/BingSearchonAppfog.war.dodeploy
        echo "WAR file deploying"
else
        echo "Nothing to do"
fi