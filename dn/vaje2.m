% 1. del
% f = @(x) exp(x);
% [g, m] = pomozna_a(f, [0 1/2 1]);
% 2. del
% r = @(x) -(x-1.58945).^2+2;
% N = 1000;
% a = 0;
% b = 2;
% x = pomozna_b(r, a, b, N);
% 3. del
% tocke = [1/2 3/2 5/2 7/2];
% dodatna_tocka = 70/37;
% g = @(x) sin(pi*x);
% u = pomozna_c(g, tocke, dodatna_tocka);
% 4. del
f = @(x)abs(x).*sin(2*exp(1.5*x)-1);
a = -1;
b = 1;
primejava1 = f(x);
n = linspace(2,8,4);
% for i = n
%     koef = remes(f,a,b,2,10);
% 
% 
% end
[koef, ms] = remes(f,a,b,4,10);




%x = linspace(-1,1)
%y = polyval(flip(koef),x)
%plot(x,y)
%hold on;
%plot(x,f(x))