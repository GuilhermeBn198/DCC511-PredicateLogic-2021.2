% Aluno: Guilherme Lucas Pereira Bernardo 2019004044
% Aluno: Kelvin Araújo Ferreira 2019037653

%------------------fatos-----------------
% Fatos - pessoa(Nome,Sexo,Altura).
pessoa(ana,f,1.68).
pessoa(bia,f,1.75).
pessoa(ivo,m,1.73).
pessoa(raí,m,1.57).

%-----------------regras------------------
casal(H, M) :- 
		pessoa(_, H, Z), 
		pessoa(_, M, W),  
		Z > W.
todosCasais :- 
		casal(H, M), 
		write([H, M]), 
		fail.


%----------------consultas----------------

?- forall(casal(H, M),writeln([H, M])).
% ?- todosCasais