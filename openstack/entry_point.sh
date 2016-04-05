#!/bin/bash

CLOUDS_XML="/etc/perspective/openstack/clouds.xml"

if [ -n "$PROJECT_NAME" ]; then
    sed -i "s|cloud_id|$PROJECT_NAME|g" $CLOUDS_XML
    sed -i "s|cloud_name|$PROJECT_NAME|g" $CLOUDS_XML
fi

if [ -n "$ENDPOINT" ]; then
    sed -i "s|http://example.com/|$ENDPOINT|g" $CLOUDS_XML
fi

if [ -n "$PROJECT_NAME" -a -n "$LOGIN" ]; then
    sed -i "s|username|$PROJECT_NAME:$LOGIN|g" $CLOUDS_XML
fi

if [ -n "$PASSWORD" ]; then
    sed -i "s|password|$PASSWORD|g" $CLOUDS_XML
fi

GC_OPTS="-XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled"
MEMORY_OPTS="-Xmx512m"
JAVA_ARGS="$GC_OPTS $MEMORY_OPTS"

java $JAVA_ARGS -Xbootclasspath/a:/etc/perspective/storage -jar /usr/share/perspective/perspective-storage/perspective-storage.jar >> /var/log/perspective/perspective-storage.log 2>&1 &
sleep 0.5
java $JAVA_ARGS -Xbootclasspath/a:/etc/perspective/rest -jar /usr/share/perspective/perspective-rest/jetty-runner.jar --classes /etc/perspective /usr/share/perspective/perspective-rest/perspective-rest.war >> /var/log/perspective/perspective-rest.log 2>&1 &
java $JAVA_ARGS -Xbootclasspath/a:/etc/perspective/openstack -jar /usr/share/perspective/perspective-openstack/perspective-openstack.jar >> /var/log/perspective/perspective-openstack.log 2>&1 &

perspective
