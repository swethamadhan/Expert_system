/* flower.pro
  flower identification game.

    start with ?- run.     */


run :-
       check(Flower),
       write('Upon checking those characteristics, the expert system deduced that flower might be: '),
       write(Flower), nl, undo.


check(lily) :- lily, !.
check(jasmine) :- jasmine, !.
check(sunflower) :- sunflower, !.
check(hibiscus) :- hibiscus, !.
check(rose) :- rose, !.
check(unknown).


lily :-
                    confirm(color_white ),
                    confirm(family_liliaceae),
                    confirm(height_1_to_8_ft).
jasmine :-
                    confirm(color_white ),
                    confirm(family_olveaceae),
                    confirm(height_1_to_8_ft).


sunflower :-
               confirm(color_yellow),
               confirm(family_asteraceae),
               confirm(height_5_to_12_ft).
hibiscus :-
                    confirm(color_red),
                    confirm(family_malvaceae),
                    confirm(height_2_to_3_ft).
rose :-
                    confirm(color_red),
                    confirm(family_rosaceae),
                    confirm(height_2_to_3_ft).





ask(Question) :-
        write('Is this one of the characteristics of the flower? '),
        write(Question), write('? '),
         read(Response), nl,
         ( (Response == yes ; Response == y)
         -> asserta(yes(Question)) ;
         assertz(no(Question)), fail).


:- dynamic([yes/1,no/1]).


confirm(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.