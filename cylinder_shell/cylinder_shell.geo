//+
SetFactory("OpenCASCADE");

Mesh.MeshSizeFromCurvature = 100;

//εξωτερικός κυκλος
//+
Circle(1) = {0, 0, 0, 1.65, 0, 2*Pi};

//+
Curve Loop(1) = {1};

Plane Surface(8) = {1};

//+00
Extrude {0, 0, 1} {Curve{1};}

//+
//+
