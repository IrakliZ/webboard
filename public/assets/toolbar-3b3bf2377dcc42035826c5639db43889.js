/**
 *
 * Created by irakli on 12/14/13.
 */



var canvas2 = 0;
// Create an empty project and a view for the canvas:
var path2 = 0;
var color2 = 'black';

function changeColor(c) {
    color2 = c.colorInput.value;
}

paper.install(window)
function toolbar() {
    alert("Hi from toolbar");
    canvas2 = document.getElementById('toolbar-canvas');
    // Create an empty project and a view for the canvas:
    paper2.setup(canvas);
    var tool2 = new Tool();

    tool2.onMouseDown = function(event) {
        // If we produced a path before, deselect it:
        if (path2) {
            path2.selected = false;
        }

        // Create a new path and set its stroke color to black:
        path2 = new Path({
            segments: [event.point],
            strokeColor: color2//,
        });
    }

    // While the user drags the mouse, points are added to the path
    // at the position of the mouse:
    tool2.onMouseDrag = function(event) {
        path2.add(event.point);
    }

    // When the mouse is released, we simplify the path:
    tool2.onMouseUp = function(event) {
        // var segmentCount = path.segments.length;
        path2.simplify(10);
    }

}
;
