length([], Length, Length).
length([_Head|Tail], Buffer, Length):-
    NewBuffer is Buffer + 1,
    length(Tail, NewBuffer, Length).
mult(List,Mult,Sort):-
    length(List, 0, ListLen),
    length(Mult, 0, MultLen),
    ListLen > 1,
    NewLen is ListLen - 1,
    MultLen = NewLen,
    isMult(List,Mult),
    isDESCSort(Sort,Mult).
isMult(List,[]):-
    length(List,0,Length), 
    Length = 1.
isMult([El1,El2|Torig],[Hmult|Tmult]):-
    Mult is El1 * El2,
    Hmult = Mult,
    isMult([El2|Torig],Tmult).
contains(El,[El|_]).
contains(El,[_|T]):-contains(El,T).
contains_all([],_Orig).
contains_all([Hdiv|Tdiv],Orig):-
    contains(Hdiv,Orig),
    contains_all(Tdiv,Orig).
isDESCSort([H1,H2|T],Mult):-
    contains(H1,Mult),
    H2=<H1,
    isDESCSort([H2|T],Mult).
isDESCSort(El,Mult):-
    length(El,0,Length),
    Length = 1,
    contains_all(El,Mult).

?-mult([2,2,3,1],[4,6,3],[6,4,3])
