param0=+0.00000000000000E+00;
param1=+1.06786542056075E+02;
param2=+1.36786542056075E+02;
param3=+3.00000000000000E+01;
param4=+3.70000000000000E+02;
param5=+4.00000000000000E+02;
param6=+4.89638130841121E+02;
param7=+5.19638130841121E+02;
param8=+5.70000000000000E+02;
param9=+6.00000000000000E+02;

d1 = 10;
Point(1) = { param0,  param0, 0., d1};
Point(2) = { param0,  param9, 0., d1};
Point(3) = { param5,  param9, 0., d1};
Point(4) = { param2,  param0, 0., d1};
Point(5) = { param2,  param6, 0., d1};
Point(6) = { param5,  param6, 0., d1};
Point(7) = { param3,  param3, 0., d1};
Point(8) = { param3,  param8, 0., d1};
Point(9) = { param4,  param8, 0., d1};
Point(10) = { param1,  param7, 0., d1};
Point(11) = { param4,  param7, 0., d1};
Point(12) = { param1,  param3, 0., d1};
Line (1) = {1, 2};
Line (2) = {2, 3};
Line (3) = {1, 4};
Line (4) = {4, 5};
Line (5) = {5, 6};
Line (6) = {3, 6};
Line (7) = {7, 8};
Line (8) = {8, 9};
Line (9) = {10, 11};
Line (10) = {9, 11};
Line (11) = {12, 10};
Line (12) = {7, 12};

Curve Loop(1) = {2, 6, -5, -4, -3, 1};

Curve Loop(2) = {7, 8, 10, -9, -11, -12};

Plane Surface(1) = {1, 2};
