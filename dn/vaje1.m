
% Bernstein
f = @(x) cos(2.*x);
g = @(x) abs(x).*cos(x.^2);
a = -1;
b = 1;
n = linspace(2,20,10);
x = linspace(a, b, 11);
% for i=n
%     bernsteinovaAproksimacija(f, a, b, i, x)
% end

% Kantrovic
k = linspace(0,200,201);
j = (k-100)/100;
primerjava1 = g(j);
napake_kantorovic = [];
ind = 1;
for i=n
    % kantorovicevaAproksimacija(f, a, b, i, x);
    % primerjava2 = kantorovicevaAproksimacija(f, a, b, i, j);
    primerjava2 = kantorovicevaAproksimacija(g, a, b, i, j);
    
    napake_kantorovic(ind) = max(abs(primerjava2-primerjava1))
    ind = ind +1;
    % plot(j,f(j));hold on;plot(j,primerjava2)
    
end




% primerjava2 = kantorovicevaAproksimacija(f, a, b,14, j)
% max(abs(primerjava2-primerjava1))
