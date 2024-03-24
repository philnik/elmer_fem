//+
SetFactory("OpenCASCADE");

Mesh.MeshSizeFromCurvature = 100;


thickness = 25e-3;

external_diameter = 1.50;

internal_diameter = external_diameter - 2 * thickness;

height = 6;

//
Circle(1) = {0, 0, 0, external_diameter, 0, 2*Pi};
Circle(2) = {0, 0, 0, internal_diameter, 0, 2*Pi};

//+
Curve Loop(1) = {1};
Curve Loop(2) = {2};


Plane Surface(1) = {1,2};

//+00
Extrude {0, 0, height} {Surface{1};}


//+
//+
