//+
SetFactory("OpenCASCADE");

Mesh.MeshSizeFromCurvature = 100;

//external_circle
//+
Circle(1) = {0,0, 0, 1.65, 0, 2*Pi};
//+
Curve Loop(1) = {1};

Plane Surface(8) = {1};

//+
Extrude {0, 0, 2} {
  Curve{1}; 
}
//+
//+
