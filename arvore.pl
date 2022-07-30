no(52, 
    no(32,
        no(12,nil,nil),
        no(35,nil,nil)), 
    no(56,
        no(55,
            no(55,nil,nil),
            nil),
        no(64,nil,nil))).
        
soma(nil, 0).
soma(no(N, ArvE, ArvD),Soma) :-
    soma(ArvE,SomaEsq),
    soma(ArvD,SomaDir),
    Soma is N + SomaEsq + SomaDir.

membro(N, no(N, _, _)) :- true, !.
membro(N, no(_, ArvE, ArvD)) :-
    membro(N, ArvE), !;
    membro(N, ArvD).
    
min(X,Y,X) :- X =< Y, !.
min(_,Y,Y).

max(X,Y,X) :- X > Y, !.
max(_,Y,Y).

minimo(nil,1000). %INF = 1000
minimo(no(N, ArvE, ArvD),Min) :-
    minimo(ArvE, MinE),
    minimo(ArvD, MinD),
    min(MinE, MinD, MinED),
    min(N, MinED, Min).
    
caminho(Y, no(Y, _, _), [Y]) :- !.
caminho(Y, no(K, ArvE, ArvD), [K|Caminho]) :-
    caminho(Y, ArvE, Caminho), !;
    caminho(Y, ArvD, Caminho).



/*
A: Crie uma regra que receba um valor X e uma ´arvore e retorne a quantidade de ocorrˆencias dele na
´arvore.
*/
ocorrencias(nil, _, 0).
ocorrencias(no(N, ArvE, ArvD),M, Oc) :-
    ocorrencias(ArvE,M,Ocesq),
    ocorrencias(ArvD,M,Ocdir),
    N =:= M,
    Oc is 1 + Ocesq + Ocdir.
ocorrencias(no(N, ArvE, ArvD),M, Oc) :-
    ocorrencias(ArvE,M,Ocesq),
    ocorrencias(ArvD,M,Ocdir),
    N =\= M,
    Oc is Ocesq + Ocdir.

/*
B: Crie uma regra que receba um valor X e uma ´arvore e retorne a quantidade de elementos maiores que
ele na ´arvore.
*/
maiorque(nil, _, 0).
maiorque(no(N, ArvE, ArvD),M, Oc) :-
    maiorque(ArvE,M,Ocesq),
    maiorque(ArvD,M,Ocdir),
    N > M,
    Oc is 1 + Ocesq + Ocdir.
maiorque(no(N, ArvE, ArvD),M, Oc) :-
    maiorque(ArvE,M,Ocesq),
    maiorque(ArvD,M,Ocdir),
    N =< M,
    Oc is Ocesq + Ocdir.

/*
C: Crie uma regra que receba uma ´arvore e retorne a m´edia dos elementos na ´arvore.
*/
media(no(N, ArvE, ArvD),M) :- maiorque(no(N, ArvE, ArvD),-1,T), soma(no(N, ArvE, ArvD),Soma), M is Soma/T.

/*
D: Crie uma regra que receba uma ´arvore e retorne a quantidade de elementos na ´arvore.
*/

nelementos(no(N, ArvE, ArvD),T) :- maiorque(no(N, ArvE, ArvD),-1,T).

/*
E: Crie uma regra para transformar uma ´arvore em uma lista. Esta lista deve simplesmente conter todos
os elementos da ´arvore.
*/

tolista(nil, []).
tolista(no(K, ArvE, ArvD), [K|Lista]) :- tolista(ArvE, Lista1), tolista(ArvD, Lista2), append(Lista1, Lista2, Lista).

/*
F: Crie uma regra que receba um valor X e uma ´arvore e seja verdade quando o valor X n˜ao est´a presente
na ´arvore.
*/
naomembro(M, no(N, ArvE, ArvD)) :- membro(M, no(N, ArvE, ArvD)) == false.


/*
G: Crie uma regra que receba uma ´arvore e retorne a lista de n´umeros visitados considerando o percorrimento em p´os-ordem.
*/
posordem(nil,[]).
posordem(no(N, ArvE, ArvD),Xs) :- 
        posordem(ArvE,Ls), 
        posordem(ArvD,Rs),
        append([N|Rs],Ls,Xs).
        

/*
H: Crie uma regra que receba uma ´arvore e retorne a lista de n´umeros visitados considerando o percorrimento em pr´e-ordem.
*/
preordem(nil,[]).
preordem(no(N, ArvE, ArvD),Xs) :- 
        preordem(ArvE,Ls), 
        preordem(ArvD,Rs),
        append([N|Ls],Rs,Xs).

/*
I: Crie uma regra que receba uma ´arvore e retorne a lista de n´umeros visitados considerando o percorrimento em em-ordem.
*/
emordem(nil, []).
emordem(no(N, ArvE, ArvD),Xs) :- 
        emordem(ArvE,Ls), 
        emordem(ArvD,Rs),
        append(Ls,[N|Rs],Xs).

/*
J: Crie uma regra que receba uma ´arvore e retorne a quantidade de folhas nela existentes.
*/
nfolhas(nil, X) :- X is 0.
nfolhas(no(_, nil, nil), X) :- X is 1.
nfolhas(no(_, ArvE, ArvD),X) :- nfolhas(ArvE,XEsq),nfolhas(ArvD,XDir), X is XEsq + XDir, !.

/*
K: Crie uma regra que receba uma ´arvore e retorne uma lista com todos os elementos encontrados nas
folhas da ´arvore.
*/

folhas(nil, []).
folhas(no(N, nil, nil), [N]).
folhas(no(_, ArvE, ArvD),X) :- folhas(ArvE,XEsq),folhas(ArvD,XDir), append(XEsq,XDir,X), !.

/*
L: Crie uma regra que receba duas ´arvore e seja verdade quando as duas ´arvores forem iguais. Duas
´arvores s˜ao iguais se elas possuem os mesmos elementos, dispostos da mesma forma.
*/

iguais(no(N, ArvE, ArvD), no(N2, ArvE2, ArvD2)) :- no(N, ArvE, ArvD) == no(N2, ArvE2, ArvD2).

/*
M: Crie uma regra que receba uma ´arvore e retorne a altura da ´arvore. Uma ´arvore com apenas o n´o
raiz possui altura 0. Assuma que n˜ao h´a nenhuma ´arvore com nenhum n´o.
*/
altura(nil,0).
altura(no(_,nil,nil),0).
altura(no(_,Esq,Dir),X) :- altura(Esq,XEsq), altura(Dir,XDir), max(XEsq,XDir,XMax), X is XMax + 1, !.

/*
N: Crie uma regra que receba uma ´arvore e dois elementos, X e Y, (sempre presentes na ´arvore) e retorne
o caminho (uma lista de elementos) entre os dois elementos, ou seja, que n´os devem ser visitados
para ir de um n´o com o elemento X at´e um n´o com o elemento Y.
*/

%caminho(no(N,Esq,Dir),To,Path)
%caminho(nil,_,_) -> não instanciado pra retornar falso.

caminho(no(N,Esq,Dir),To,[N|Path]) :- (caminho(Esq,To,Path) ; caminho(Dir,To,Path)).

/*se o nodo examinado for o destino, coloca ele na lista e retorna*/
caminho(no(N,_,_),N,[N]). 

caminhoFromTo(no(N,Esq,Dir),From,To,Path) :-  caminho(no(N,Esq,Dir),From,PathFrom), caminho(no(N,Esq,Dir),To,PathTo), reverse(PathFrom, PathFrom2), rm_last(PathFrom2, PathFrom3), append(PathFrom3, PathTo, Path), !.

rm_last([_], []).
rm_last([X|Xs], [X|WithoutLast]) :- rm_last(Xs, WithoutLast).
