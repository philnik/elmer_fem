// GMSH script to create a solid disk
lc = 50.0;
// Define parameters for the disk
r = 32;  // Radius of the disk
h = 400;  // Height of the disk
cx = 0; // X-coordinate of the center
cy = 0; // Y-coordinate of the center

// Define the center point of the circle
Point(11) = {cx, cy, 0, lc};  // Center point at (cx, cy, 0)
Point(12) = {cx + r, cy    , 0, lc};  // EAST
Point(13) = {cx - r, cy    , 0, lc};  // WEST
Point(14) = {cx    , cy - r, 0, lc};  // SOUTH
Point(15) = {cx    , cy + r, 0, lc};  // NORTH

// Create the circle using the three points
// point1, center, point2
// 4 arc 90degrees E-N-W-S-E
Circle(21) = {12, 11, 15}; 
Circle(22) = {15, 11, 13};
Circle(23) = {13, 11, 14};
Circle(24) = {14, 11, 12}; 

// Curve Loop(6) = {21,22,23,24}; // Create a curve loop from the circles (circle 1 and circle 2, negative for change direction) CW/CCW


Curve Loop(2) = {22, 23, 24, 21};
//+
Surface(27) = {2};
//+
Extrude {0, 0, h} {
  Surface{27}; 
}
