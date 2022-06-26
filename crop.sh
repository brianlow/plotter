#!/bin/bash

INPUT=$1
OUTPUT=${INPUT%.svg}-cropped.svg

echo $INPUT -> $OUTPUT
vpype read "$INPUT" scaleto 100 100 crop 50 50 10 10 write ${OUTPUT}