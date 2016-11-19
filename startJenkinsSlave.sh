#!/bin/sh


$JAVA_HOME/bin/java -Xms$SLAVE_XMS -Xmx$SLAVE_XMX -jar /slave.jar -jnlpUrl $JNLP_URL
