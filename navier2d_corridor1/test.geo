SetFactory("OpenCASCADE");

d1 = 1;
Point(1) = { +7.86935966705600E+00,  +6.71484375000000E+00, 0., d1};
Point(2) = { +1.26857659170560E+01,  +6.71484375000000E+00, 0., d1};
Point(3) = { +1.26857659170560E+01,  +5.51953125000000E+00, 0., d1};
Point(4) = { +7.86935966705600E+00,  +5.51953125000000E+00, 0., d1};
Point(5) = { +7.86935966705600E+00,  +4.73437500000000E+00, 0., d1};
Point(6) = { +1.26857659170560E+01,  +4.73437500000000E+00, 0., d1};
Point(7) = { +1.26857659170560E+01,  +3.53906250000000E+00, 0., d1};
Point(8) = { +7.86935966705600E+00,  +3.53906250000000E+00, 0., d1};
Point(9) = { +7.86935966705600E+00,  +2.75390625000000E+00, 0., d1};
Point(10) = { +1.26857659170560E+01,  +2.75390625000000E+00, 0., d1};
Point(11) = { +1.26857659170560E+01,  +1.55859375000000E+00, 0., d1};
Point(12) = { +7.86935966705600E+00,  +1.55859375000000E+00, 0., d1};
Point(13) = { +7.86935966705600E+00,  +7.73437500000000E-01, 0., d1};
Point(14) = { +1.26857659170560E+01,  +7.73437500000000E-01, 0., d1};
Point(15) = { +1.26857659170560E+01,  -4.21875000000000E-01, 0., d1};
Point(16) = { +7.86935966705600E+00,  -4.21875000000000E-01, 0., d1};
Point(17) = { +5.95905943408000E+00,  +7.80496570439400E+00, 0., d1};
Point(18) = { +1.47139564821850E+01,  +7.80496570439400E+00, 0., d1};
Point(19) = { +1.47139564821850E+01,  -1.40750436016200E+00, 0., d1};
Point(20) = { +5.95905943408000E+00,  -1.40750436016200E+00, 0., d1};
Line (1) = {1, 2};
Line (2) = {2, 3};
Line (3) = {3, 4};
Line (4) = {4, 1};
Line (5) = {5, 6};
Line (6) = {6, 7};
Line (7) = {7, 8};
Line (8) = {8, 5};
Line (9) = {9, 10};
Line (10) = {10, 11};
Line (11) = {11, 12};
Line (12) = {12, 9};
Line (13) = {13, 14};
Line (14) = {14, 15};
Line (15) = {15, 16};
Line (16) = {16, 13};
Line (17) = {17, 18};
Line (18) = {18, 19};
Line (19) = {19, 20};
Line (20) = {20, 17};
//+
Curve Loop(1) = {17, 18, 19, 20};
//+
// Plane Surface(1) = {1};
//+
Curve Loop(2) = {1, 2, 3, 4};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {5, 6, 7, 8};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {9, 10, 11, 12};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {13, 14, 15, 16};
//+
Plane Surface(5) = {5};
//+
Plane Surface(6) = {1,2,3,4,5};

// Surface Loop(128) = {2,3,4,5};
// Surface Loop(128) = {1,128};