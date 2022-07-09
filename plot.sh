#!/bin/bash

INPUT=$1
OUTPUT=${INPUT%.svg}.gcode

echo "$INPUT -> $OUTPUT"
vpype --config "${PWD}/vpype.toml" read "$INPUT" scale --origin 0 86mm -- 1 -1 translate 45mm 38mm linemerge linesort gwrite --profile default "$OUTPUT"



# TODO: filter --min-length 0.5mm
# TODO: combine all layers (so don't need to group in AD), split out based on stroke/color?, pens command?
