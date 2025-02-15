#!/bin/bash

# Create blazegraph group and user
groupadd -g $BLAZEGRAPH_GID blazegraph
useradd -s /bin/false -g blazegraph -u $BLAZEGRAPH_UID blazegraph

# Make sure permissions are good
chown -R blazegraph:blazegraph "$JETTY_BASE"
chown -R blazegraph:blazegraph "$TMPDIR"

# Use gosu or su-exec to switch users and run the application
if command -v gosu &> /dev/null; then
    exec gosu blazegraph:blazegraph java $JAVA_OPTS -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/RWStore.properties -jar /usr/local/jetty/start.jar
else
    echo "Error: gosu or su-exec is not installed. Please install it and try again."
    exit 1
fi
