go :-
write('What is the student''s name? '),
read(Student),get_single_char(Code),
hypothesis(Student,University),
write_list([Student,', the best suited university is ',University,'.']),nl.

course(Student,coed) :-
verify(Student," need a coed (y/n) ?").
course(Student,library) :-
verify(Student," need a best library (y/n) ?").
course(Student,dorm) :-
verify(Student," need a best dorm (y/n) ?").
course(Student,culturals) :-
verify(Student," need a best culturals (y/n) ?").

ask(Student,Question) :-
	write(Student),write(', do you'),write(Question),
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



hypothesis(Student,gvm_university) :-
course(Student,coed),
course(Student,dorm),
course(Student,culturals).

hypothesis(Student,slr_university) :-
course(Student,coed),
course(Student,library),
course(Student,culturals).

hypothesis(Student,rpm_university) :-
course(Student,coed),
course(Student,library),
course(Student,culturals).

hypothesis(Student,tags_university) :-
course(Student,library),
course(Student,dorm),
course(Student,culturals).


write_list([]).
write_list([Term| Terms]) :-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).
