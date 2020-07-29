%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This Matlab file demomstrates solution of higher-order (2nd Order) differential equations with initial conditions.
% Author: Asif Ahmad, MS(Mathematics), UeT Peshawar, Pakistan. 
% All Rights Reserved
% E-mail: asifahmad7007@gmail.com

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all,
clear all,
clc,

h=input(' Enter value of h = '); % step size
t0 = input ('Enter value of to = '); % initial time
tn = input(' Enter value of tn = '); % Final time
t = t0:h:tn;
x = zeros(1,length(t)); 
y = zeros(1,length(t));
x(1) = input(' Enter the value of initial condition u1(t) = '); % u1(t)=y(t)   ; initial conditions.
y(1) = input(' Enter the value of initial condition u2(t) = '); % u2(t)=y'(t)
% f1 represents u1'(t) and f2 represents u2'(t). Also u'(t)=u2(t)
f1 = input(' Write the first function in the system as an anonymous function f1 = '); %i.e @(t,x,y) expression
f2 = input(' Write the second function in the system as an anonymous function f2 = ');
for i=1:(length(t)-1);          % calculation loop
    kx1 = h*f1(t(i),x(i),y(i));
    ky1 = h*f2(t(i),x(i),y(i));
    kx2 = h*f1(t(i)+(h/2),x(i)+0.5*kx1,y(i)+0.5*ky1);
    ky2 = h*f2(t(i)+(h/2),x(i)+0.5*kx1,y(i)+0.5*ky1);
    kx3 = h*f1(t(i)+(h/2),x(i)+0.5*kx2,y(i)+0.5*ky2);
    ky3 = h*f2(t(i)+(h/2),x(i)+0.5*kx2,y(i)+0.5*ky2);
    kx4 = h*f1(t(i)+h,x(i)+kx3,y(i)+ky3);
    ky4 = h*f2(t(i)+h,x(i)+kx3,y(i)+ky3);
    x(i+1) = x(i)+(1/6)*(kx1+2*kx2+2*kx3+kx4) % The approximate solution value of f1 at i+1
    y(i+1) = y(i)+(1/6)*(ky1+2*ky2+2*ky3+ky4) % The approximate solution value of f2 at i+1
end