%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This Matlab file demomstrates Adams-Bashforth 4th order 4-step method
% Author: Asif Ahmad, MS(Mathematics), UeT Peshawar, Pakistan. 
% All Rights Reserved
% E-mail: asifahmad7007@gmail.com

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Adams methods are based on the idea of approximating the integrand with a polynomial within the interval (tn, tn+1). 
Using a kth order polynomial results in a k+1th order method. 
There are two types of Adams methods, the explicit and the implicit types. 
The explicit type is called the Adams-Bashforth (AB) methods and the implicit type is called the Adams-Moulton (AM) methods.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
for i=4:(length(x)-1);
    y(i+1) = y(i)+(h/24)*(55*f(x(i),y(i))-59*f((x(i)-h),y(i-1))+37*f((x(i)-2*h),y(i-2))-9*f((x(i)-3*h),y(i-3)))
end