
var canvas = 0;
// Create an empty project and a view for the canvas:
var path = 0;
var textItem = 0;
var color = 'black';

function changeColor(c) {
	color = c.colorInput.value;
}

paper.install(window)
window.onload = function() {
	canvas = document.getElementById('canvas1');
	// Create an empty project and a view for the canvas:
	paper.setup(canvas);
	var tool = new Tool();
	textItem = new PointText({
		//content: 'Click and drag to draw a line.',
		point: new Point(20, 30),
		fillColor: 'black',
	});

	tool.onMouseDown = function(event) {
		// If we produced a path before, deselect it:
		if (path) {
			path.selected = false;
		}

		// Create a new path and set its stroke color to black:
		path = new Path({
			segments: [event.point],
			strokeColor: color//,
			// Select the path, so we can see its segment points:
			//fullySelected: true
		});
	}

	// While the user drags the mouse, points are added to the path
	// at the position of the mouse:
	tool.onMouseDrag = function(event) {
		path.add(event.point);

		// Update the content of the text item to show how many
		// segments it has:
		//textItem.content = 'Segment count: ' + path.segments.length;
	}

	// When the mouse is released, we simplify the path:
	tool.onMouseUp = function(event) {
		// var segmentCount = path.segments.length;
		// When the mouse is released, simplify it:

		path.simplify(10);
		var y = JSON.stringify(Base.serialize(path.segments));
		//paper.view.draw();
		// textItem.content = y

		// Select the path, so we can see its segments:
		// path.fullySelected = true;

		// var newSegmentCount = path.segments.length;
		// var difference = segmentCount - newSegmentCount;
		// var percentage = 100 - Math.round(newSegmentCount / segmentCount * 100);
		//textItem.content = difference + ' of the ' + segmentCount + ' segments were removed. Saving ' + percentage + '%';
	}
}