#!/bin/sh
: "${JAVA_HOME:?JAVA_HOME is not set}"
: "${XEP_HOME:?XEP_HOME is not set}"

XML_FILE=xliff-extended-v2.3-part2.xml
HTML_FILE=out/html/xliff-extended-v2.3-part2.html
FO_FILE=out/pdf/xliff-extended-v2.3-part2.fo
PDF_FILE=out/pdf/xliff-extended-v2.3-part2.pdf

mkdir -p out/html out/pdf

rm -f $XML_FILE $HTML_FILE $FO_FILE $PDF_FILE
$JAVA_HOME/bin/java -cp lib/merger.jar com.maxprograms.xml.Merger xliff23.xml $XML_FILE

$JAVA_HOME/bin/java -jar lib/saxon.jar -o $HTML_FILE $XML_FILE stylesheets/oasis-specification-html.xsl

$JAVA_HOME/bin/java -jar lib/saxon.jar -o $FO_FILE $XML_FILE stylesheets/oasis-specification-fo-a4.xsl
$XEP_HOME/xep -fo $FO_FILE -pdf $PDF_FILE