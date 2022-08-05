go :-
write('What is the patient''s name? '),
read(Patient),get_single_char(Code),
hypothesis(Patient,Disorder),
write_list([Patient,', probably has ',Disorder,'.']),nl.

go :-
write('Sorry, I don''t seem to be able to'),nl,
write('diagnose the disease.'),nl.

symptom(Patient,feeling_sad) :-
verify(Patient," are u feeling sad (y/n) ?").
symptom(Patient,confused_thinking) :-
verify(Patient," are u feeling confused (y/n) ?").
symptom(Patient,mood_changes) :-
verify(Patient," are u facing extreme mood changes (y/n) ?").
symptom(Patient,tiredness) :-
verify(Patient," are u facing extreme tiredness (y/n) ?").
symptom(Patient, depression) :-
verify(Patient," are u feeling depressed (y/n) ?").
symptom(Patient, anger) :-
verify(Patient," do u feel furious all the time (y/n) ?").
symptom(Patient, drug_usage) :-
verify(Patient," do u have a high consumption of alcohol (y/n) ?").
symptom(Patient, complexity) :-
verify(Patient," are u feeling useless (y/n) ?").
symptom(Patient, eating_disorder) :-
verify(Patient," do u always feel like hunger (y/n) ?").
symptom(Patient, stress) :-
verify(Patient," are u stressed (y/n) ?").
symptom(Patient, disease) :-
verify(Patient," are u facing some serious medical condition like cancer (y/n) ?").

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



hypothesis(Patient,psychotic_disorder) :-
symptom(Patient,stress),
symptom(Patient,disease),
symptom(Patient,anger),
symptom(Patient,depression).

hypothesis(Patient,post_traumatic_disorder) :-
symptom(Patient,tiredness),
symptom(Patient,anger),
symptom(Patient,complexity),
symptom(Patient,mood_changes),
symptom(Patient,stress).

hypothesis(Patient,bipolar_diorder) :-
symptom(Patient,mood_changes),
symptom(Patient,confused_thinking),
symptom(Patient,anger).

hypothesis(Patient,panic_diorder) :-
symptom(Patient,depression),
symptom(Patient,anger),
symptom(Patient,mood_changes),
symptom(Patient,confused_thinking),
symptom(Patient,feeling_sad),
symptom(Patient,disease),
symptom(Patient,stress),
symptom(Patient,complexity).



hypothesis(Patient,mood_disorder) :-
symptom(Patient,confused_thinking),
symptom(Patient,feeling_disorder).

hypothesis(Patient,personality_disorder) :-
symptom(Patient,depression),
symptom(Patient,stress),
symptom(Patient,drug_usage),
symptom(Patient,complexity).

write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).


