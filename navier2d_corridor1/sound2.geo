d1 = 10;
Point(1) = { +1.18E+01,  +3.234375E+00, 0., d1};
Point(2) = { +1.21E+03,  +3.234375E+00, 0., d1};
Point(3) = { +1.21E+03,  +1.03234375000000E+02, 0., d1};
Point(4) = { +1.18E+01,  +1.03234375E+02, 0., d1};
Point(5) = { +1.18E+01,  +1.53234375E+02, 0., d1};
Point(6) = { +1.21E+03,  +1.53234375E+02, 0., d1};
Point(7) = { +1.21E+03,  +2.53234375E+02, 0., d1};
Point(8) = { +1.18E+01,  +2.53234375E+02, 0., d1};
Point(9) = { +1.18E+01,  -1.46765625E+02, 0., d1};
Point(10) = { +1.21E+03,  -1.46765625E+02, 0., d1};
Point(11) = { +1.21E+03,  -4.67656250E+01, 0., d1};
Point(12) = { +1.18E+01,  -4.67656250E+01, 0., d1};
Point(13) = { +1.18E+01,  -2.96765625E+02, 0., d1};
Point(14) = { +1.21E+03,  -2.96765625E+02, 0., d1};
Point(15) = { +1.21E+03,  -1.96765625E+02, 0., d1};
Point(16) = { +1.18E+01,  -1.96765625E+02, 0., d1};
Point(17) = { +1.18E+01,  -4.46765625E+02, 0., d1};
Point(18) = { +1.21E+03,  -4.46765625E+02, 0., d1};
Point(19) = { +1.21E+03,  -3.46765625E+02, 0., d1};
Point(20) = { +1.18E+01,  -3.46765625E+02, 0., d1};
Point(21) = { +1.18E+01,  -5.96765625E+02, 0., d1};
Point(22) = { +1.21E+03,  -5.96765625E+02, 0., d1};
Point(23) = { +1.21E+03,  -4.96765625E+02, 0., d1};
Point(24) = { +1.18E+01,  -4.96765625E+02, 0., d1};
Point(25) = { +1.18E+01,  -7.46765625E+02, 0., d1};
Point(26) = { +1.21E+03,  -7.46765625E+02, 0., d1};
Point(27) = { +1.21E+03,  -6.46765625E+02, 0., d1};
Point(28) = { +1.18E+01,  -6.46765625E+02, 0., d1};
Point(29) = { +1.72E+03,  +3.03234375E+02, 0., d1};
Point(30) = { -4.47E+02,  +3.03234375E+02, 0., d1};
Point(31) = { +1.72E+03,  -7.96765625E+02, 0., d1};
Point(32) = { -4.47E+02,  -7.96765625E+02, 0., d1};
Line (1) = {1, 2};
Line (2) = {2, 3};
Line (3) = {3, 4};
Line (4) = {5, 6};
Line (5) = {6, 7};
Line (6) = {7, 8};
Line (7) = {5, 6};
Line (8) = {6, 7};
Line (9) = {7, 8};
Line (10) = {9, 10};
Line (11) = {10, 11};
Line (12) = {11, 12};
Line (13) = {13, 14};
Line (14) = {14, 15};
Line (15) = {15, 16};
Line (16) = {17, 18};
Line (17) = {18, 19};
Line (18) = {19, 20};
Line (19) = {21, 22};
Line (20) = {22, 23};
Line (21) = {23, 24};
Line (22) = {25, 26};
Line (23) = {26, 27};
Line (24) = {27, 28};
Line (25) = {29, 30};
Line (26) = {31, 32};
Line (27) = {30, 32};
Line (28) = {29, 31};
Line (29) = {8, 5};
Line (30) = {4, 1};
Line (31) = {12, 9};
Line (32) = {16, 13};
Line (33) = {20, 17};
Line (34) = {24, 21};
Line (35) = {28, 25};
//+
Curve Loop(1) = {25, 27, -26, -28};
//+
// Plane Surface(1) = {1};
//+
Curve Loop(2) = {6, 29, 4, 5};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {3, 30, 1, 2};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {12, 31, 10, 11};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {15, 32, 13, 14};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {18, 33, 16, 17};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {21, 34, 19, 20};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {24, 35, 22, 23};
//+
Plane Surface(8) = {8};

Plane Surface(9) = {1,2,3,4,5,6,7,8};