#!/bin/sh
: "${JAVA_HOME:?JAVA_HOME is not set}"
: "${XEP_HOME:?XEP_HOME is not set}"

XML_FILE=xliff-memory-v1.0.xml
FO_FILE=out/pdf/xliff-memory-v1.0.fo

rm -rf out
mkdir -p out/html out/pdf

rm -f $XML_FILE
$JAVA_HOME/bin/java -cp ../xliff-23/lib/merger.jar com.maxprograms.xml.Merger xliff-tm.xml $XML_FILE

$JAVA_HOME/bin/java -jar ../xliff-23/lib/saxon.jar -o out/html/xliff-memory-v1.0.html $XML_FILE stylesheets/oasis-note-html.xsl

$JAVA_HOME/bin/java -jar ../xliff-23/lib/saxon.jar -o $FO_FILE $XML_FILE stylesheets/oasis-note-fo-a4.xsl
$XEP_HOME/xep -fo $FO_FILE -pdf out/pdf/xliff-memory-v1.0.pdf
