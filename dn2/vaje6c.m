clear all;
clc;
f = @(x) abs(x).*cos(x.^2);
a = -1;
b = 1;
n_tab = 10%2:2:20;
j = linspace(a,b,11);
% figure; plot(j, f(j)); hold on
for i=1:length(n_tab)
    n = n_tab(i);
    x = linspace(a, b, n+1);
    t = [x(1) x(1) x(1) x x(end) x(end) x(end)];
    c = zeros(1,n+3);
    for i=1:(n+3)
        if (i==1)
            lambdaf = f(x(1));
        elseif (i==2)
            lambdaf = 1/18*(-5*f(x(1)) + 40*f(1/2*(x(1)+x(2))) - 24*f(x(2)) + 8*f(1/2*(x(2)+x(3))) - f(x(3)));
        elseif (i==(n+2))
            lambdaf = 1/18*(-f(x(n-1)) + 8*f(1/2*(x(n-1)+x(n))) - 24*f(x(n)) + 40*f(1/2*(x(n)+x(n+1))) - 5*f(x(n+1)));
        elseif (i==(n+3))
            lambdaf = f(x(n+1));
        else
            lambdaf = 1/6*(f(x(i-3+1)) - 8*f(1/2*(x(i-1)+x(i-2))) + 20*f(x(i-2+1)) - 8*f(1/2*(x(i-1)+x(i))) + f(x(i)));
        end
        c(i) = lambdaf;
    end
    % c'
    y = deBoor(t,c,j);
    y'
    j = linspace(a,b,201);
    % plot(j, y); hold on
    kubicna = max(abs(deBoor(t,c,j)-f(j)));
    LinearnaNapaka = max(abs(odsekomaLinearnaAproksimacija(f,a,b,n,j) - f(j)));
    
end

