
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
for i=n
    kantorovicevaAproksimacija(f, a, b, i, x)
end
