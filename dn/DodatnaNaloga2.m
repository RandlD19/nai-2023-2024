f = @(x)abs(x).*sin(2*exp(1.5*x)-1);
a = -1;
b = 1;

[koef, ms] = remes(f,a,b,4,5);

x = linspace(-1,1,1000);
%ocena napake aproksimacije!
max(abs(f(x) - polyval(flip(koef), x)))