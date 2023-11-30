function napaka = L2_napaka(a,b,f,F,koef)
% Funkcija sprejme interval [a,b], funkcijo f, bazo F in vodilne koeficiente 
% funkicje f* izračunane po MNK. Vrne (L2) napako MNK aproksimacije glede na 
% normo, inducirano z zveznim skalarnim produktom. 
%============================================================================
apr = @(t) 0*t; % vzamemo funkcijo identično enako 0
for i=1:length(F)
    % na vsakem koraku prištejemo vodilni koef * bazni polinom (npr. 2.45x^2). Tako dobimo pnea po MNK
    apr = @(t) apr(t) + koef(i)*F{i}(t); 
end
razlika = @(t) apr(t)-f(t); % izračunamo razliko med pnea po MNK in dejansko funkcijo, ki jo aproksimiramo
razlika = @(t) razlika(t).*razlika(t); % L2 norma je integral kvadrata funkcije v mejah od a do b
napaka = sqrt(integral(razlika, a, b, 'AbsTol',1e-14, 'RelTol',1e-14));
end