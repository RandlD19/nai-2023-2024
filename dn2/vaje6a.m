clear  all;
clc;
t = [0   0   0   0   2   4   6   8  10  10  10  10];
c = [5  7  3  9  2  4  1  6];
x = linspace(0,10,21);
y = deBoor(t,c,x)