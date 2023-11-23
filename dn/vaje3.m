f = @(x) exp(sin(x.^2/10));
a = 0;
b = 2*pi;
% zvezni skalarni produkt 
g = @(l,h) integral(@(x) l(x)*h(x),a,b,"ArrayValued",true);
% polinom najboljše aproksimacije iz P_4 izražen v potenčni bazi
n = 4;
F = cell(1,n+1);
F{1} = @(x) 1;
F{2} = @(x) x;
F{3} = @(x) x^2;
F{4} = @(x) x^3; 
F{5} = @(x) x^4;

g(F{1},F{2})

mnk(f,F,g)