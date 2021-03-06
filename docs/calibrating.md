# Calibrating your plotter

The pen is offset from the nozzle so we need to find the plottable area along with the z-height.

![calibration print](calibrating.png)

This is an SVG we can plot to verify the plottable area. The arrows in the corner denote the extent of the plottable area. The crosshairs should align with the guidelines on the smooth sheet.

For my printer:
* x-axis can plot 45mm - 254.4mm
* y-axis can plot 38mm - 212mm
* z-axis at 7mm the pen is down, 10mm for pen up

Procedure:
1. Mount a pen, remember the rubber band
2. Install a smooth sheet
3. Find origin (or 0,0) point for the pen:
	  1. On the smooth sheet, find lower left corner of the rectangle of the printable area
	  2. Use Settings -> Move Axis to move the pen directly above this point
	  3. Note the X and Y values, these will be in millimeters (mine are 45mm, 38mm)
	  4. In `plot.sh`, change the `translate` command to use these values
4. Find the max point for the pen:
	  1. Move the pen to the upper right and note the X and Y (mine are 254.4mm, 212mm)
5.   Determine the plottable area:
	  1. Subtract the max values from the origin values
	  2. Subtract another 2mm for both axis to avoid hitting the endstops (not sure if this is actually necessary)
	  3. For my machine, X = 254.4 - 45 -2 = 207.4 (I rounded to 207), Y = 212 - 38 - 2 = 172
6. Determine z-height:
	  1. Use Settings -> Move Axis -> Z to lower the pen so it is just touching the paper, then lower 1mm more. This is the "pen down" height
	  2. Raise the pen so it is a few mm above the paper. This is the "pen up" height. Lower is better because faster travel.
	  3. Raise the pen so it is above any obstructions you may have like magnets holding the paper. This is the "pen travel" height
	  4. In vpype.toml, change the `G00 Z` commands with your values above. So if your "pen down" height is 7mm, then use `G00 Z7 F750`. The `F750` is speed in mm/min. I get these values from the Prusa Slicer config (note they are in mm/sec)
7. Print the calibration diagram
    1. If your printable area is a different size, you'll want to use Affinity Designer to resize the document. File -> Document Setup -> change dimensions and anchor the lower left corner. In the resulting document, move the red corner markers to the new corners. Export as SVG.
	  2. Place paper with lower left corner aligned with lower left corner of phyiscal sheet
	  3. Secure with magnets, tape or binder clips. Place them on the lower edge, middle and/or right side (the lower left may interfere with Auto Homing). And on the back edge of the physical sheet.
	  4. `./plot.sh calibration/calibration.svg`
	  5. Print `calibration/calibration.gcode`
	  6. Arrows show the extents of the plottable area
	  7. Crosses should match up with the 5cm guidelines on the smooth sheet
