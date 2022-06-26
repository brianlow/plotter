#!/bin/bash

INPUT=$1
OUTPUT=${INPUT%.svg}-cleaned.svg

echo $INPUT -> $OUTPUT
vpype read "$INPUT" linemerge --tolerance 0.1mm linesort write ${OUTPUT}