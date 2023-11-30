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
F{3} = @(x) x.^2;
F{4} = @(x) x.^3; 
F{5} = @(x) x.^4;

g = @(l,h) integral(@(x) l(x)*h(x),a,b,"ArrayValued",true);
% g(F{1},F{2});
y = mnk(f,F,g);
napakaZ = L2_napaka(a,b,f,F,y);

% Diskretni skalarni produkt
h = @(l,p) (1/(50+1))*sum(l(2*pi*linspace(0,1,50+1)).*p(2*pi*linspace(0,1,50+1)));
y1 = mnk(f,F,h);
napakaD = L2_napaka(a,b,f,F,y1);


% Polinom najboljše aproksimacije iz P_4 izražen v trigonometrični bazi
G = cell(1,5);
G{1} = @(x) 0.*x + 1/sqrt(2*pi);
G{2} = @(x) cos(x)/sqrt(pi);
G{3} = @(x) sin(x)/sqrt(pi);
G{4} = @(x) cos(2.*x)/sqrt(pi);
G{5} = @(x) sin(2.*x)/sqrt(pi);

% Zvezni skalarni produkt
y2 = mnk(f,G,g);
napakaZ_T = L2_napaka(a,b,f,G,y2);

% Diskretni skalarni produkt
y3 = mnk(f,G,h);
napakaD_T = L2_napaka(a,b,f,G,y3);

