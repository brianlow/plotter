#!/bin/bash

INPUT=$1
OUTPUT=${INPUT%.svg}-scaled.svg

echo $INPUT -> $OUTPUT
vpype read "$INPUT" scaleto 200mm 170mm linemerge -t 1mm linesimplify linesort write --page-size 254.4x212mm --center ${OUTPUT}