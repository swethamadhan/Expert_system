go :-
write('What is your name? '),
read(User),get_single_char(Code),
hypothesis(User,Movie),
write_list([User,', the movie we recommend to you is ',Movie,'.']),nl.

go :-
write('Sorry, I don''t seem to be able to recommend any movie'),nl.

recommended(User, action) :-
verify(User," do you like action movies(y/n) ?").
recommended(User, animation) :-
verify(User," do you like animation movies (y/n) ?").
recommended(User, comedy) :-
verify(User," do you like comedy movies (y/n) ?").
recommended(User, drama) :-
verify(User," do you like drama movies (y/n) ?").
recommended(User, fantasy) :-
verify(User," do you like fantasy movies (y/n) ?").
recommended(User, horror) :-
verify(User," do you like horror movies?").

ask(User,Question) :-
	write(User),write(', do you'),write(Question),
	read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

verify(P,S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(P,S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.



hypothesis(User, tenet) :-
recommended(User,action).

hypothesis(User, zootopia) :-
recommended(User,animation).

hypothesis(User, hangover) :-
recommended(User,comedy).

hypothesis(User, marriage_story) :-
recommended(User,drama).


hypothesis(User, harry_potter) :-
recommended(User,fantasy).

hypothesis(User, conjuring) :-
recommended(User,horror).

write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).
