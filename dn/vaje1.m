
% Bernstein
f = @(x) cos(2.*x);
g = @(x) abs(x)*cos(x.^x);
a = -1;
b = 1;
n = linspace(2,8,4);
x = linspace(a, b, 11);
% for i=n
%     bernsteinovaAproksimacija(f, a, b, i, x)
% end

% Kantrovic
k = linspace(0,200,201);
j = (k-100)/100;
primerjava1 = f(j);
for i=n
    % kantorovicevaAproksimacija(f, a, b, i, x);
    primerjava2 = kantorovicevaAproksimacija(f, a, b, i, j);
    
    plot(j,f(j));hold on;plot(j,primerjava2)
    
end
odsekomaLinearnaAproksimacija(f, a, b,6, x)



primerjava2 = kantorovicevaAproksimacija(f, a, b,14, j)





max(abs(primerjava2-primerjava1))
