% Aluno: Guilherme Lucas Pereira Bernardo 2019004044
% Aluno: Kelvin Araújo Ferreira 2019037653

%------------------fatos-----------------
entrada(pao).
entrada(salada).
prato(carne).
prato(peixe).
prato(massa).
sobremesa(fruta).
sobremesa(pudim).
sobremesa(sorvete).

%-----------------regras------------------
menu(E,P,S):-
    	entrada(E),
    	prato(P),
    	sobremesa(S).

%----------------consultas----------------
% para ver o TOTAL de possibilidades
?-aggregate_all(count, (menu(E,P,S)), Count). OU menu(E,P,S) 

% para ver cada 1 das possibilidades
?-(menu(E,P,S)