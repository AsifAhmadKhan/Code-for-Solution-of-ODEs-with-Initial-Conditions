%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This Matlab file demomstrates Adams-Moulton 4th order 3-step method
% Author: Asif Ahmad, MS(Mathematics), UeT Peshawar, Pakistan. 
% All Rights Reserved
% E-mail: asifahmad7007@gmail.com

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Codes for 4th-Order 3-Step Adams-Moulton Technique.
h=input(' Enter value of h = ');% step size
to = input ('Enter value of to = ');
tn = input(' Enter value of tn = ');
x = to:h:tn; 
y = zeros(1,length(x)); 
y(1) = input(' Enter the value of initial condition = ');  
f = input(' Write the function as an anonymous function = '); %i.e @(t,y) expression                     
for i=1:(length(x)-1)          % calculation loop
    k1 = h*f(x(i),y(i));
    k2 = h*f(x(i)+0.5*h,y(i)+0.5*k1);
    k3 = h*f((x(i)+0.5*h),(y(i)+0.5*k2));
    k4 = h*f((x(i)+h),y(i)+k3);

    y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4); % Next approximate solution at i+1 
end
for i=3:(length(x)-1);
    y(i+1) = y(i)+(h/24)*(9*f(x(i+1),y(i+1))+19*f(x(i),y(i))-5*f(x(i-1),y(i-1))+f(x(i-2),y(i-2)))
end