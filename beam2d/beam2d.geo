d1 = 30;

p0 = 250;
// p0 = -00;
p1 = +1.950E+03+p0;
p2 =  +2.05E+03+p0;

w = +5.0E+01;

length = +4.0E+03;

pright = length - 0.1E+03;

Point(1) = { +0.00000000000000E+00,  +0.00000000000000E+00, 0., d1};
Point(2) = { +1E+02,  +0.00000000000000E+00, 0., d1};
Point(3) = { length,  +0.00000000000000E+00, 0., d1};
Point(4) = { length,  w, 0., d1};
Point(5) = { +0.00000000000000E+00,  w, 0., d1};
Point(6) = { p1,  +0.00000000000000E+00, 0., d1};
Point(7) = { p2,  +0.00000000000000E+00, 0., d1};
Point(8) = { pright,  +0.00000000000000E+00, 0., d1};
Line (1) = {1, 2};
Line (2) = {3, 4};
Line (3) = {4, 5};
Line (4) = {5, 1};
Line (5) = {6, 7};
Line (6) = {8, 3};
Line (7) = {2, 6};
Line (8) = {7, 8};
//+
Curve Loop(1) = {3, 4, 1, 7, 5, 8, 6, 2};
//+
Plane Surface(1) = {1};
