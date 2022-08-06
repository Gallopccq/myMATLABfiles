clear all;
t=1:0.0001:2*pi;
theta = t*360;
r=1.5*cos(50*theta) + 1;
polar(theta,r,'r');