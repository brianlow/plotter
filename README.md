Pen Plotter with the Prusa MK3S+
--------------------------------

### Hardware
* Prusa MK3S+ 
* [Pen Plotter Attachment](https://www.printables.com/model/63385-pen-plotter-attachment-for-prusa-mk3s) - this a great design, easy to switch pens, calibration tool for consistent z-height, mount does not interfere with regular printing

### Calibrate
1. Mount a pen, remember the rubber band
2. Install a smooth sheet
3. Find origin (or 0,0) point for the pen:
	1. On the smooth sheet, find lower left corner of the rectangle of the printable area
	2. Use Settings -> Move Axis to move the pen directly above this point
	3. Note the X and Y values, these will be in millimeters (mine are 45mm, 38mm)
	3. In plot.sh, change the `translate` command to use these values
4. Find the max point for the pen:
	1. Move the pen to the upper right and note the X and Y (mine are 254.4mm, 212mm)
5. Determine the printable area:
	1. Subtract the max values from the origin values
	2. Subtract another 2mm for both axis to avoid hitting the endstops
	3. For my machine, X = 254.4 - 45 -2 = 207.4 (I rounded to 207), Y = 212 - 38 - 2 = 172
	4. In plot.sh, change the `scaleto` command to use these printable area values
6. Determine z-height:
	1. Use Settings -> Move Axis -> Z to lower the pen so it is just touching the paper, then lower 1mm more. This is the "pen down" height
	2. Raise the pen so it is a few mm above the paper. This is the "pen up" height. Lower is better because faster travel.
	3. Raise the pen so it is above any obstructions you may have like magnets holding the paper. This is the "pen travel" height
	4. In vpype.toml, change the `G00 Z` commands with your values above. So if you "pen down" height is 7mm, then use `G00 Z7 F750`. The `F750` is speed in mm/min. I get these values from the Prusa Slicer config (note they are in mm/sec)

### Workflow
1. Layout the SVG
	a. Affinity Designer -> New -> Print -> 207 mm wide x 172 high, units: millimeters
	b. Insert your SVG
	c. If modifying or have multiple object, group the vector layers together (Layer toolbox -> select all -> right-click Group). vpype will optimize paths within a layer.
	c. Export -> SVG
2. ./plot.sh myfile.svg
3. Print myfile.gcode

