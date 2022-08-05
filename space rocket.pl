go :-
write('What is the activator''s name? '),
read(Activator),get_single_char(Code),
hypothesis(Activator,Launch),
write_list([Activator,', may ',Launch,'.']),nl.

go :-
write('Sorry, something fishy, I can''t'),nl,
write('predict the weather.'),nl.

weather(Activator,fuel) :-
verify(Activator," have you checked your fuel level (y/n) ?").
weather(Activator,rain) :-
verify(Activator," is it rainy (y/n) ?").
weather(Activator,cloud) :-
verify(Activator," is cloudy(y/n) ?").
weather(Activator,wind) :-
verify(Activator," is windy (y/n) ?").
weather(Activator,humidity) :-
verify(Activator,"is the humidity is normal (y/n) ?").
weather(Activator,constraits) :-
verify(Activator," Is the weather condition shaky (y/n) ?").

ask(Activator,Question) :-
	write(Activator),write(', do you'),write(Question),
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



hypothesis(Activator,launch):-
weather(Activator,fuel),
weather(Activator,rain),
weather(Activator,cloud),
weather(Activator,humidity),
weather(Activator,constrait),
weather(Activator,wind).

hypothesis(Activator,preventlaunch) :-
weather(Activator,constrait).

write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).
