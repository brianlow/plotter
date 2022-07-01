#!/bin/bash

INPUT=$1
OUTPUT=${INPUT%.svg}.gcode

echo "$INPUT -> $OUTPUT"
vpype --config "${PWD}/vpype.toml" read "$INPUT" translate 45mm 38mm linemerge --tolerance 0.1mm linesort gwrite --profile default "$OUTPUT"
