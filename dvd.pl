% Relacao de filmes
%    filme(id, titulo, ano, diretor, nacionalidade).
%
filme(f1, 'Monty Python: O Sentido da Vida', 1983, 'Terry Jones', uk).
filme(f2, 'Edukators', 2004, 'Hans Weingartner', de).
filme(f3, 'Lavoura Arcaica', 2001, 'Luiz Fernando Carvalho', br).
filme(f4, 'Lisbela e o Prisioneira', 2003, 'Guel Arraes', br).
filme(f5, 'Abril despeda�ado', 2001, 'Walter Salles', br).
filme(f6, 'Diários de motocicleta', 2004, 'Walter Salles', br).

% Relacao de paises
%     pais(sigla, nome).
%
pais(uk, 'Unided Kingdom').
pais(de, 'Alemanha').
pais(br, 'Brasil').

% Relacao de DVD (a caixa em si)
%     dvd(id do DVD, id do filme, estante).
%
dvd(d1, f1, est1).
dvd(d2, f2, est1).
dvd(d4, f4, est1).
dvd(d3, f3, est2).
dvd(d5, f5, est3).
dvd(d6, f1, est1).
dvd(d7, f2, est4).
dvd(d8, f2, est4).

% Relacao de clientes
%     cliente(cod, nome, telefone).
%
cliente(c1, 'Bob', '333-3112').
cliente(c2, 'Zeca', '245-1099').
cliente(c3, 'Tom', '323-0685').
cliente(c4, 'Bianca', '333-4391').
cliente(c5, 'Alice', '251-7439').
cliente(c6, 'Maria', '212-3271').

% Relacao de locacoes
%     locacao(cod cliente, nro do DVD, data de entrega)
%
locacao(c1, d1, '2005-11-07').
locacao(c1, d2, '2005-11-07').
locacao(c3, d5, '2005-11-09').
locacao(c2, d3, '2005-11-10').
locacao(c3, d3, '2005-11-11').
locacao(c4, d8, '2005-11-12').
locacao(c5, d7, '2005-11-12').
locacao(c6, d6, '2005-11-12').
locacao(c1, d5, '2005-11-13').
locacao(c1, d6, '2005-11-13').
locacao(c6, d2, '2005-11-14').
locacao(c3, d7, '2005-11-14').
locacao(c3, d8, '2005-11-14').
locacao(c5, d1, '2005-11-15').


% a)
% ?- findall(N, (filme(_,N,A,_,_), A < 2001), L).
% L = ['Monty Python: O Sentido da Vida'].

% b)
% ?- findall(N, (filme(_,N,A,_,_), A < 2005, A > 2000),L).
% L = ['Edukators', 'Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despeda�ado', 'Diários de motocicleta'].

% c)
% ?- findall(N, (filme(_,N,_,_,P), P == br), L), sort(L,LSorted).
% L = ['Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despeda�ado', 'Diários de motocicleta'],
% LSorted = ['Abril despeda�ado', 'Diários de motocicleta', 'Lavoura Arcaica', 'Lisbela e o Prisi

% d)
% ?- findall(N, (filme(_,N,_,_,P), P \= br), L), sort(L,LSorted).
% L = ['Monty Python: O Sentido da Vida', 'Edukators'],
% LSorted = ['Edukators', 'Monty Python: O Sentido da Vida'].

% e)

% ?- findall([N,D], (filme(_,N,A,D,P), A < 2005, P == de), L), sort(L,LSorted).
% L = LSorted, LSorted = [['Edukators', 'Hans Weingartner']].

% f)
% ?- findall(ID, (filme(F,_,_,_,P), dvd(ID,F,_), P \= br), L).
% L = [d1, d6, d2, d7, d8].

% g)
% ?- findall(ID, (filme(F,_,_,_,P), dvd(ID,F,E), P == br, E==est2), L).
% L = [d3].

% h)
% ?- findall(D, (filme(F,_,_,D,_), dvd(_,F,E), E==est1), L), sort(L, LSorted).
% L = ['Terry Jones', 'Terry Jones', 'Hans Weingartner', 'Guel Arraes'],
% LSorted = ['Guel Arraes', 'Hans Weingartner', 'Terry Jones'].


% i)
% ?- findall(N, (filme(F,N,_,_,_), not(dvd(_,F,_))),L).
% L = ['Diários de motocicleta'].

% j)
% ?- findall(P, (filme(F,_,_,_,P), dvd(_,F,E), (E==est1; E==est4)),L).
% L = [uk, uk, de, de, de, br].

% o)
% ?- bagof(N, F ^ ID ^ A ^ D ^ P ^(dvd(ID, F, E), filme(F, N, A, D, P)) , L).
% E = est1,
% L = ['Monty Python: O Sentido da Vida', 'Edukators', 'Lisbela e o Prisioneira', 'Monty Python: O Sentido da Vida'] ;
% E = est2,
% L = ['Lavoura Arcaica'] ;
% E = est3,
% L = ['Abril despeda�ado'] ;
% E = est4,
% L = ['Edukators', 'Edukators'].

% r)
% ?- setof(N, F ^ A ^ D ^ P ^ ID ^ E ^ F ^ C ^Data ^ Tel ^ (filme(F, N, A, D, P), dvd(ID, F, E), locacao(C, ID, Data), cliente(C, Cliente, Tel)), L).
% Cliente = 'Alice',
% L = ['Edukators', 'Monty Python: O Sentido da Vida'] ;
% Cliente = 'Bianca',
% L = ['Edukators'] ;
% Cliente = 'Bob',
% L = ['Abril despeda�ado', 'Edukators', 'Monty Python: O Sentido da Vida'] ;
% Cliente = 'Maria',
% L = ['Edukators', 'Monty Python: O Sentido da Vida'] ;
% Cliente = 'Tom',
% L = ['Abril despeda�ado', 'Edukators', 'Lavoura Arcaica'] ;
% Cliente = 'Zeca',
% L = ['Lavoura Arcaica'].
