Pen Plotter with the Prusa MK3S+
--------------------------------

### Hardware
* Prusa MK3S+
* [Pen Plotter Attachment](https://www.printables.com/model/63385-pen-plotter-attachment-for-prusa-mk3s) - this is a great design, easy to switch pens, calibration tool for consistent z-height, mount does not interfere with regular printing

### Software
* Affinity Designer (can probably use Inkscape too)
* python 3
* `pip install vpype`
* `pip install vpype-gcode`

### Calibrate
[Calibrating]

### Workflow
1. Layout the SVG
	1. Open the SVG in Affinity Designeer -> select all -> copy
	1. Affinity Designer -> New -> Print -> use width and height of your plottable area (e.g. 207 x 172 mm), units: millimeters
	2. Paste the SVG
	3. If modifying the SVG or have multiple object, group the vector layers together (Layer toolbox -> select all -> right-click Group). vpype will optimize paths within a layer.
	4. Export -> SVG
2. `./plot.sh myfile.svg`
3. Print myfile.gcode
