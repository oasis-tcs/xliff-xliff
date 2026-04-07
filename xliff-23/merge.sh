#!/bin/sh
XML_FILE=xliff-extended-v2.3-part2.xml
rm -f $XML_FILE
java -cp lib/merger.jar com.maxprograms.xml.Merger xliff23.xml $XML_FILE