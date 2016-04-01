#!/bin/bash

CLOUDS_XML="/etc/perspective/openstack/clouds.xml"

if [ -z "$NAME" ]; then
    sed -i "s|cloud_id|$NAME|g" $CLOUDS_XML
    sed -i "s|cloud_name|$NAME|g" $CLOUDS_XML
fi

if [ -z "$ENDPOINT" ]; then
    sed -i "s|http://example.com/|$ENDPOINT|g" $CLOUDS_XML
fi

if [ -z "$PROJECT_NAME" -a -z "$LOGIN" ]; then
    sed -i "s|username|$PROJECT_NAME:$LOGIN|g" $CLOUDS_XML
fi

if [ -z "$PASSWORD" ]; then
    sed -i "s|password|$PASSWORD|g" $CLOUDS_XML
fi

sudo restart perspective-storage
sleep 0.5
sudo restart perspective-rest
sudo restart perspective-openstack

perspective
