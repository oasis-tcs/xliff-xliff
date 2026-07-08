#!/bin/sh
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
XML_FILE=xliff-core-v2.3-part1.xml
rm -f $XML_FILE
$JAVA_HOME/bin/java -cp lib/merger.jar com.maxprograms.xml.Merger core23.xml $XML_FILE