d1 = 10;
Point(1) = { +5.22692063800000E-03,  +0.00000000000000E+00, 0., d1};
Point(2) = { +1.00000000000000E+03,  +0.00000000000000E+00, 0., d1};
Point(3) = { +1.00000000000000E+03,  +3.24773421694950E+01, 0., d1};
Point(4) = { +8.22756245255272E+02,  +3.24773421694950E+01, 0., d1};
Point(5) = { +8.22756245255272E+02,  +1.91116667382030E+02, 0., d1};
Point(6) = { +8.66347174125868E+02,  +1.91116667382030E+02, 0., d1};
Point(7) = { +8.66347174125868E+02,  +2.23594009551525E+02, 0., d1};
Point(8) = { +7.90278903085776E+02,  +2.23594009551525E+02, 0., d1};
Point(9) = { +7.90278903085776E+02,  +3.24773421694950E+01, 0., d1};
Point(10) = { +2.05163299692203E+02,  +3.24773421694950E+01, 0., d1};
Point(11) = { +2.05163299692203E+02,  +2.23594009551525E+02, 0., d1};
Point(12) = { +1.29095028652111E+02,  +2.23594009551525E+02, 0., d1};
Point(13) = { +1.29095028652111E+02,  +1.91116667382030E+02, 0., d1};
Point(14) = { +1.72685957522707E+02,  +1.91116667382030E+02, 0., d1};
Point(15) = { +1.72685957522708E+02,  +3.24773421694950E+01, 0., d1};
Point(16) = { +5.22692063800000E-03,  +3.24773421694950E+01, 0., d1};
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
Line (12) = {12, 13};
Line (13) = {13, 14};
Line (14) = {14, 15};
Line (15) = {15, 16};
Line (16) = {16, 1};
//+
Curve Loop(1) = {11, 12, 13, 14, 15, 16, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
//+
Plane Surface(1) = {1};
