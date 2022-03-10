% Aluno: Guilherme Lucas Pereira Bernardo 2019004044
% Aluno: Kelvin Araújo Ferreira 2019037653

%------------------fatos-----------------
% 	partidas(Voo, Destino, HoraPrevista, HoraReal) 
partidas('TP123', 'Lisboa', 14.5, 14.5).
partidas('NI234', 'Manchester', 15.42, 16.0).
partidas('TP876', 'Faro', 14.3, 14.5).
partidas('NI498', 'Madrid', 15.0, 15.0).
% 	chegadas(Voo, Origem, HoraPrevista, HoraReal)
chegadas('TP123', 'Lisboa', 14.0, 14.58).
chegadas('NI533', 'Funchal', 15.0, 15.0).
chegadas('TP877', 'Santiago', 14.5, 15.0).
chegadas('NI498', 'Manchester', 16.0, 15.83).

%-----------------regras------------------
parteHoras(V) :- 
			partidas(V, _, X, Y), 
			X == Y.
idaEvolta(V) :- 
			partidas(V, Y, _, _), 
			chegadas(V, Z, _, _), 
			Y == Z.
connection(V, W) :- 
			partidas(_, W, _, _), 
			chegadas(_, V, _, _), 
			V \== W.
chegarLate(V) :- 
			chegadas(V, _, V, H), 
			H > V.
conflito(V) :- 
			partidas(V, _, V, H), 
			chegadas(V, _, V, H), 
			V < H.

%----------------consultas----------------
% sucede se a hora real de partida do voo indicado como parâmetro for a  hora inicialmente prevista;
?- parteHoras(V).
% sucede se o voo indicado como parâmetro efetua viagens de, e para, uma  mesma cidade
?- idaEvolta(V).
% sucede  se  existe  um  voo  que  chega  da  cidade  indicada  como  primeiro  parâmetro e parte para a cidade indicada como segundo parâmetro (a cidade destino da  ligação não deverá ser a mesma que a cidade origem); 
?- connection(V,W).
% sucede se a hora real de chegada do voo indicado como parâmetro  for posterior a hora inicialmente prevista; 
?- chegarLate(V).
% este predicado testa, para os voos em que esteja prevista uma partida e  uma chegada, se a hora real de partida é anterior a hora real de chegada. 
?- conflito(V).