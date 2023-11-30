f = @(x) cos(2.*x);
g = @(x) abs(x).*cos(x.^2);
a = -1;
b = 1;
n = linspace(2,20,10);
x = linspace(a, b, 11);


primerjava1 = g(j);
k = linspace(0,200,201);
j = (k-100)/100;
napake_bernstein = [];
red_berstein = [];
ind = 1;
for i=n

    primerjava2 = odsekomaLinearnaAproksimacija(g, a, b, i, j);
    napake_bernstein(ind) = max(abs(primerjava2-primerjava1))
    if ind == 1
        red_berstein(ind) = NaN;
        ind = ind +1;
        continue
    end
    red_berstein(ind) = log(napake_bernstein(ind)/napake_bernstein(ind-1))/log(ind * 2/(ind * 2 -2));
    ind = ind +1;
end



