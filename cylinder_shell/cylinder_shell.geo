//+
SetFactory("OpenCASCADE");

Mesh.MeshSizeFromCurvature = 100;

//εξωτερικός κυκλος
//+
Circle(1) = {0, 0, 0, 1.65, 0, 2*Pi};
Circle(2) = {0, 0, 1, 1.65, 0, 2*Pi};
Circle(3) = {0, 0, 2, 1.65, 0, 2*Pi};
Circle(4) = {0, 0, 3, 1.65, 0, 2*Pi};
Circle(5) = {0, 0, 4, 1.65, 0, 2*Pi};
Circle(6) = {0, 0, 5, 1.65, 0, 2*Pi};
Circle(7) = {0, 0, 6, 1.65, 0, 2*Pi};

//+
Curve Loop(1) = {1};
Curve Loop(2) = {2};
Curve Loop(3) = {3};
Curve Loop(4) = {4};
Curve Loop(5) = {5};
Curve Loop(6) = {6};
Curve Loop(7) = {7};


Plane Surface(8) = {1};

//+00
Extrude {0, 0, 1} {Curve{1};}
Extrude {0, 0, 1} {Curve{2};}
Extrude {0, 0, 1} {Curve{3};}
Extrude {0, 0, 1} {Curve{4};}
Extrude {0, 0, 1} {Curve{5};}
Extrude {0, 0, 1} {Curve{6};}
Extrude {0, 0, 1} {Curve{7};}

//+
//+
