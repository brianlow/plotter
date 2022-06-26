#!/bin/bash

INPUT=$1
OUTPUT=${INPUT%.svg}.gcode

echo "$INPUT -> $OUTPUT"
vpype --config "${PWD}/vpype.toml" read "$INPUT" scaleto 207mm 172mm translate 45mm 38mm gwrite --profile default "$OUTPUT"