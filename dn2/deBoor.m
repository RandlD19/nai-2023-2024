function y = deBoor(t,c,x)
%DEBOOR Summary of this function goes here
%   Detailed explanation goes here
N = length(t);
k = N - length(c) -1;
y = zeros(size(x));
for l=1:length(x)
    trenutni_x = x(l);
    t2 = t(1:N-k-1); % znebimo se zadnjih k+1 elementov (so isti?)
    j = length(t2(t2<=trenutni_x));

    tabela = zeros(k+1, k+1);
    tabela(:,1) = c((j-k):j);
    for r=2:k+1
        poracunan_r = r-1;
        for i=r:k+1
            poracunan_i = i-(k+1)+j;
            
            w = (trenutni_x-t(poracunan_i))/(t(poracunan_i+k+1-poracunan_r)-t(poracunan_i));
            c_i = (1-w)*tabela(i-1,r-1) + w*tabela(i,r-1);
            tabela(i,r) = c_i;
        end
    end
    y(l) = tabela(end, end);

end

end

