go :-
write('What is the disease''s name? '),
read(Disease),get_single_char(Code),
hypothesis(Decision),
write_list([Disease,' is classified as ',Decision,'.']),nl.



go :-
write_list(['Sorry, I can''t classify the disease']),nl.

feature(direct) :-
verify("Is the disease transmitted through direct contact(y/n)?").

feature(ptop) :-
verify("Is the disease transmitted from person to person(y/n)?").

feature(std) :-
verify("Is the disease transmitted must sexual activity(y/n)?").

feature(droplet):-
verify("Is the disease transmitted through cough and snezze(y/n)?").

feature(indirect):-
verify("Is the disease transmitted through indirect contact(y/n)?").

feature(airborne):-
verify("Is the disease transmitted through air(y/n)?").

feature(object):-
verify("Is the disease transmitted through contaminated object(y/n)?").

feature(food):-
verify("Is the disease transmitted through food or water(y/n)?").

feature(animal):-
verify("Is the disease transmitted through animal contact(y/n)?").




ask(Question) :-
	write(Question),
	read(N),
	( (N == yes ; N == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

verify(S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.

hypothesis(sexuallyTransmittedDisease):-
    feature(direct),
    feature(ptop),
    feature(std).

hypothesis(coughsAndSneezesSpreadDiseases):-
    feature(direct),
    feature(ptop),
    feature(droplet).

hypothesis(airBorne):-
    feature(indirect),
    feature(airborne).

hypothesis(objectTransmission):-
    feature(indirect),
    feature(object).

hypothesis(physicalFoodborne):-
    feature(indirect),
    feature(food).

hypothesis(animalBorne):-
    feature(indirect),
    feature(animal).




write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).
