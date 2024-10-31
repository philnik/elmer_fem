param0=+0.00000000000000E+00;
param1=+1.01390201014686E+02;
param2=+2.36110638184250E+01;
param3=+3.10372692656876E+02;
param4=+3.23725860080107E+02;
param5=+4.10765496929239E+02;
param6=+5.23334603471295E+02;
param7=+5.76836476902537E+02;
param8=-5.63526136181580E+01;
param3=500;
param8=-100.0;
param7=600.0;

d1 = 3;

Point(1) = { param4,  param2, 0., d1};
Point(2) = { param4,  param3, 0., d1};
Point(3) = { param0,  param3, 0., d1};
Point(4) = { param0,  param2, 0., d1};
Point(5) = { param8,  param2, 0., d1};
Point(6) = { param8,  param0, 0., d1};
Point(7) = { param7,  param0, 0., d1};
Point(8) = { param7,  param2, 0., d1};
Point(9) = { param6,  param2, 0., d1};
Point(10) = { param6,  param1, 0., d1};
Point(11) = { param5,  param1, 0., d1};
Point(12) = { param5,  param2, 0., d1};
Line (1) = {1, 2};
Line (2) = {2, 3};
Line (3) = {3, 4};
Line (4) = {4, 5};
Line (5) = {5, 6};
Line (6) = {6, 7};
Line (7) = {7, 8};
Line (8) = {8, 9};
Line (9) = {9, 10};
Line (10) = {10, 11};
Line (11) = {11, 12};
Line (12) = {12, 1};
//+
Curve Loop(1) = {3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2};
//+
Plane Surface(1) = {1};
