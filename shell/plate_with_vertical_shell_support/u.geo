//-----------------------------------------------------
// Three lines forming an open U
//-----------------------------------------------------
l=0.05;
h = 0.5;    // height of legs
w = 1.4;    // width
dz = 1.0;   // extrusion distance

// Points
Point(1) = {0, 0, 0,l};    // left bottom
Point(2) = {0, h, 0,l};    // left top
Point(3) = {w, h, 0,l};    // right top
Point(4) = {w, 0, 0,l};    // right bottom

// Lines (open U shape)
Line(1) = {1,2};   // left vertical
Line(2) = {2,3};   // top horizontal
Line(3) = {3,4};   // right vertical

//-----------------------------------------------------
// Extrude each line → produces exactly 1 surface per line
//-----------------------------------------------------

out[] = Extrude {0,0,dz} { Line{1,2,3}; };  // left surface

l0  = out[0];   // new line from Line(1)
l1   = out[4];   // new line from Line(2)
l2 = out[8];  // new line from Line(3)

Printf("top curve = %g", out[0]);
Printf("surface = %g", out[1]);
Printf("side curves = %g and %g", out[2], out[3]);


For i In {0:#out[]-1}
  Printf("out1[%g] = %g", i, out[i]);
EndFor


out[] = Extrude {0,0.3,0.00} { Line{l1}; };
out[] = Extrude {0,0,dz} { Line{l0,l2}; };
out[] = Extrude {0,0,-dz} { Line{1,2,3}; };
