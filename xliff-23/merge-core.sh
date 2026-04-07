#!/bin/sh
XML_FILE=xliff-core-v2.3-part1.xml
rm -f $XML_FILE
java -cp lib/merger.jar com.maxprograms.xml.Merger core23.xml $XML_FILE