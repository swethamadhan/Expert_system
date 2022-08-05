go :-
write('What is the patient''s name? '),
read(Patient),get_single_char(Code),
hypothesis(Patient,Disease),
write_list([Patient,', probably has ',Disease,'.']),nl.

go :-
write('Sorry, I don''t seem to be able to'),nl,
write('diagnose the disease.'),nl.

symptom(Patient,iris) :-
verify(Patient," do you have change in eye iris color (y/n) ?").
symptom(Patient,crossed_eyes) :-
verify(Patient," is your eyes crossed (y/n) ?").
symptom(Patient,double_vision) :-
verify(Patient," is your vision is double (y/n) ?").
symptom(Patient,dry_eyes) :-
verify(Patient," is your eyes dry (y/n) ?").
symptom(Patient,eye_pain) :-
verify(Patient," do you have pain in your eyes (y/n) ?").
symptom(Patient,eyelid) :-
verify(Patient," do you facing growing bump on the eyelid (y/n) ?").
symptom(Patient,vision) :-
verify(Patient," have u lossed a vision (y/n) ?").
symptom(Patient,redness) :-
verify(Patient," is your eyes seems red (y/n) ?").
symptom(Patient,sensitivity) :-
verify(Patient," are u facing unusal sensitivity to light or glare (y/n) ?").
symptom(Patient,hazy) :-
verify(Patient," are u facing blurred vision (y/n) ?").
symptom(Patient,tears) :-
verify(Patient," are u facing excess discharge or tearing (y/n) ?").

ask(Patient,Question) :-
	write(Patient),write(', do you'),write(Question),
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



hypothesis(Patient,macular_degeneration) :-
symptom(Patient,vision),
symptom(Patient,eyelid),
symptom(Patient,eye_pain),
symptom(Patient,double_vision).

hypothesis(Patient,cataract) :-
symptom(Patient,hazy),
symptom(Patient,tears),
symptom(Patient,sensitivity),
symptom(Patient,redness),
symptom(Patient,cross_eyes).

hypothesis(Patient,retinopathy) :-
symptom(Patient,dry_eyes),
symptom(Patient,eyelids),
symptom(Patient,vision).

hypothesis(Patient,glaucoma) :-
symptom(Patient,sensitivity),
symptom(Patient,redness),
symptom(Patient,dryness),
symptom(Patient,tears),
symptom(Patient,double_vision),
symptom(Patient,hazy),
symptom(Patient,vision),
symptom(Patient,iris).



hypothesis(Patient,amblyopia) :-
symptom(Patient,dryness),
symptom(Patient,redness).

hypothesis(Patient,strabismus) :-
symptom(Patient,vision),
symptom(Patient,tears),
symptom(Patient,hazy),
symptom(Patient,sensitivity).

write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).







