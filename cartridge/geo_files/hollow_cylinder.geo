

// GMSH script to create a solid disk
lc = 50.0;
// Define parameters for the disk
r_in = 32;
r_out = 140.0;
r_ext = 400.0;
height = 400;  // Height of the disk
cx = 0; // X-coordinate of the center
cy = 0; // Y-coordinate of the center


p0 = newp;
r = r_in;
// Define the center point of the circle
Point( p0 + 11) = {cx, cy, 0, lc};  // Center point at ( p0 + cx, cy, 0)
Point( p0 + 12) = {cx + r, cy    , 0, lc};  // EAST
Point( p0 + 13) = {cx - r, cy    , 0, lc};  // WEST
Point( p0 + 14) = {cx    , cy - r, 0, lc};  // SOUTH
Point( p0 + 15) = {cx    , cy + r, 0, lc};  // NORTH
Circle( p0 + 21) = {p0 + 12, p0 + 11, p0 + 15}; 
Circle( p0 + 22) = {p0 + 15, p0 + 11, p0 + 13};
Circle( p0 + 23) = {p0 + 13, p0 + 11, p0 + 14};
Circle( p0 + 24) = {p0 + 14, p0 + 11, p0 + 12}; 
Curve Loop( p0 + 2) = {p0 + 22, p0 + 23, p0 + 24, p0 + 21};

p1 = newp;
r = r_out;
// Define the center point of the circle
Point( p1 + 11) = {cx, cy, 0, lc};  // Center point at ( p1 + cx, cy, 0)
Point( p1 + 12) = {cx + r, cy    , 0, lc};  // EAST
Point( p1 + 13) = {cx - r, cy    , 0, lc};  // WEST
Point( p1 + 14) = {cx    , cy - r, 0, lc};  // SOUTH
Point( p1 + 15) = {cx    , cy + r, 0, lc};  // NORTH
Circle( p1 + 21) = {p1 + 12, p1 + 11, p1 + 15}; 
Circle( p1 + 22) = {p1 + 15, p1 + 11, p1 + 13};
Circle( p1 + 23) = {p1 + 13, p1 + 11, p1 + 14};
Circle( p1 + 24) = {p1 + 14, p1 + 11, p1 + 12}; 
Curve Loop( p1 + 2) = {p1 + 22, p1 + 23, p1 + 24, p1 + 21};


p2 = newp;
r = r_ext;
// Define the center point of the circle
Point( p2 + 11) = {cx, cy, 0, lc};  // Center point at ( p2 + cx, cy, 0)
Point( p2 + 12) = {cx + r, cy    , 0, lc};  // EAST
Point( p2 + 13) = {cx - r, cy    , 0, lc};  // WEST
Point( p2 + 14) = {cx    , cy - r, 0, lc};  // SOUTH
Point( p2 + 15) = {cx    , cy + r, 0, lc};  // NORTH
Circle( p2 + 21) = {p2 + 12, p2 + 11, p2 + 15}; 
Circle( p2 + 22) = {p2 + 15, p2 + 11, p2 + 13};
Circle( p2 + 23) = {p2 + 13, p2 + 11, p2 + 14};
Circle( p2 + 24) = {p2 + 14, p2 + 11, p2 + 12}; 
Curve Loop( p2 + 2) = {p2 + 22, p2 + 23, p2 + 24, p2 + 21};

Printf("p0 = %g", p0);//1
Printf("p1 = %g", p1);//17
Printf("p2 = %g", p2);//33

s = newp;

Plane Surface(s + 1) = {p0 + 2};
Plane Surface(s + 2) = {p0 + 2, p1 + 2 };
Plane Surface(s + 3) = {p1 + 2, p2 + 2 };

v = 1;

Extrude {0, 0, 400} {  Surface{s + 1}; } // inside air inlet
Extrude {0, 0, 400} {  Surface{s + 2}; } //  porous
Extrude {0, 0, 400} {  Surface{s + 3}; } // outlet

// Physical Volume(100) = {1};
// Physical Volume(101) = {2};
// Physical Volume(102) = {3};

//+

