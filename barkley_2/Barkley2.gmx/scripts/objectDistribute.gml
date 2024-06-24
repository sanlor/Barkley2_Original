#define objectDistribute
/// objectDistribute(obj, collisionType, gridSize, floodGridSize, divs, sourceX, sourceY)
/* Nicely distributes objects across the part of the map which is reachable by the
   object. It divides the accessible area into a grid, and fills each part of the
   grid with an instance of obj, if the grid part does not already contain an instance
   of the object. */

var obj = argument0;
var collType = argument1;
var gridSize = argument2;
var floodGridSize = argument3;
var divs = argument4;
var sourceX = argument5;
var sourceY = argument6;

var start = current_time;

// Get a flood representing the accessible area
var flood = floodFill(scr_collisionSystem_collisionTreeOfType(collType), floodGridSize, sourceX, sourceY);

// Fill the area with things
for (var _x = 0; _x < room_width; _x += gridSize) {
    for (var _y = 0; _y < room_height; _y += gridSize) {
        if (!collision_rectangle(_x, _y, _x+gridSize, _y+gridSize, obj, false, true)) {
            objectDistribute_addInSection(obj, _x, _y, _x+gridSize, _y+gridSize, divs, flood, floodGridSize, collType);
        }
    }
}

ds_grid_destroy(flood);

var fin = current_time;
show_debug_message("Gen time: " + string(fin-start))

#define objectDistribute_addInSection
/// objectDistribute_addInSection(obj, left, top, right, bottom, divs, flood, floodGridSize, collisionType)

var obj = argument0;
var lft = argument1;
var top = argument2;
var rgt = argument3;
var btm = argument4;
var divs = argument5;
var flood = argument6;
var floodGridSize = argument7;
var collType = argument8;

var w = rgt - lft;
var h = rgt - lft;
var divW = w / divs;

// Get all points that we could place the object in in this area
var pointList = ds_list_create();
for (var _x = lft; _x <= rgt; _x += w/divs) {
    for (var _y = top; _y <= btm; _y += h/divs) {
        var px = _x - (divW/2) + random(divW);
        var py = _y - (divW/2) + random(divW);
        if (scr_collision_point_free(px, py, 0, collType) and
                ds_grid_get(flood, floor(px/floodGridSize), floor(py/floodGridSize)) != 0) {
            var point = ds_list_create();
            point[| 0] = px;
            point[| 1] = py;
            ds_list_add(pointList, point);
        }
    }
}

// If no points, dont place anything
if (ds_list_empty(pointList)) {
    ds_list_destroy(pointList);
    return 0;
}

// Pick a point and place an object there
var point = ds_list_choose(pointList);
instance_create(point[| 0], point[| 1], obj);

// Clean up my junk after me
while (!ds_list_empty(pointList)) {
    var p = pointList[| 0]
    ds_list_destroy(p);
    ds_list_delete(pointList, 0);
}
ds_list_destroy(pointList);