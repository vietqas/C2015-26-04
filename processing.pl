:- op(510,xfy,=>).


:-[sentence].
:-[question].
:-[theme_processing].
:-[data_set].

:- dynamic sem/2.

processing_sen(InputSentence, Result, asserted(SemS), Flag):-
	parse_semantic(SemS, InputSentence, Result),
	(Result = assertion -> insert_(Flag, SemS)).

parse_semantic(SemS, InputSentence, assertion):- s(SemS, InputSentence, []).
%parse_semantic(_, _, fail).
insert_(true, Sem) :- asserta(Sem),!.
%update(_, static('Không phân tích được')).
% process(S, Result, SemS) :- s(SemS, S, []), assert(SemS) -> Result =
% true; Result = false, !.
%process(S, Result, SemS) :- s(SemS, S, []), reply(SemS).
%process(S, Result, SemS) :- s(SemS, S, []), assert(SemS).


parse_semantic(answer(X, wh(Mean)) => SemS, InputQuestion, question) :- q(answer(X, wh(Mean)) => SemS, InputQuestion, []).

process(InputSentence, Result, SemS, Flag):-
	parse_semantic(answer(X, wh(Mean)) => SemS, InputSentence, Result),
	(Result = question -> setof(X, SemS, Flag)).

processing_que(InputQuestion, who, SemS, answer(Flag)):-
	q(answer(X, who(Mean)) => SemS, InputQuestion, []),
	(setof(X, SemS, Flag)).

processing_que(InputQuestion, what, SemS, answer(Flag)):-
	q(answer(X, what(Mean)) => SemS, InputQuestion, []),
	(setof(X, SemS, Flag)).

processing_que(InputQuestion, how_qua, SemS, answer(Flag)):-
	q(answer(X, how_qua(Mean)) => SemS, InputQuestion, []),
	(setof(X, SemS, Flag)).


processing_que(InputQuestion, how_adj, SemS, answer_how_adj(Flag)):-
	que(answer(X, how_adj(Mean)) => SemS, InputQuestion, []),
	(setof(X, SemS, Flag)).

processing_que(InputQuestion, what_time, SemS, answer(Flag)):-
	que(answer(X, what_time(Mean)) => SemS, InputQuestion, []),
	(setof(X, SemS, Flag)).

processing_que(InputQuestion, where, SemS, answer(Flag)):-
	que(answer(X, where(Mean)) => SemS, InputQuestion, []),
	(setof(X, SemS, Flag)).



/*
process(InputQuestion, yes_no, SemS, X):-
	que(answer(X, yes_no) => SemS, InputQuestion, []),
	(call(SemS)),
	writeln('Processing Yes-No Question. ID: 1').
*/
process(InputQuestion, yes_no, SemS, X):-
	que(answer(X, yes_no) => SemS, InputQuestion, []),
	(setof(X, SemS, Flag)),
	writeln('Processing Yes-No Question. ID: 2').




processing_que(InputQuestion, class_8, SemS, answer(Flag1, Flag2)):-
	que(answer(two(Where, What_time), qc(WhT, WhP)) => SemS, InputQuestion, []),
	setof(Where, SemS, Flag1),
	setof(What_time, SemS, Flag2).

processing_que(InputQuestion, class_8, SemS, answer(Flag1, Flag2)):-
	que(answer(two(Where, What_time), who_time(WhT, WhP)) => SemS, InputQuestion, []),
	setof(Where, SemS, Flag1),
	setof(What_time, SemS, Flag2).

processing_que(InputQuestion, class_8, SemS, answer(Flag1, Flag2)):-
	que(answer(two(Where, What_time), what_What_time(WhT, WhP)) => SemS, InputQuestion, []),
	setof(Where, SemS, Flag1),
	setof(What_time, SemS, Flag2).


test_p1(R, Sem, Flag):- processing_sen([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC'], R, Sem, Flag).

test_p2(R, Sem):- process([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, 2, ngân, hàng, quốc, tế, 'HSBC', tại, 'Hà', 'Nội'], R, Sem).


test_p3(R, Sem) :- process([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, nhiều, ngân, hàng, quốc, tế, 'HSBC', vào, ngày, 30, tháng, 4, năm, 2015], R, Sem).

test_p4(R, Sem) :- process([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, 2, ngân, hàng, quốc, tế, 'HSBC', rất, lớn], R, Sem).

test_p5(R, Sem, Flag) :- process([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC', rất, lớn, tại, thành, phố, 'Hà', 'Nội', vào, ngày, 30, tháng, 4, năm, 2015], R, Sem, Flag).

test_pz(R, Sem) :- process([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, nhiều, ngân, hàng, quốc, tế, 'HSBC', tại, thành, phố, 'Hà', 'Nội', vào, ngày, 30, tháng, 4, năm, 2015], R, Sem, Flag).

all_t :- test_p1(A1,B1),test_p2(A2,B2),test_p3(A3,B3),test_p4(A4,B4),test_p5(A5,B5), test_pz(A6,B6).


test_pp1(R, Sem, Flag):-
	processing_sen([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC', tại, 'Hà', 'Nội', vào, ngày, 30, tháng, 4, năm, 2016], R, Sem, Flag).

test_pp2(R, Sem, Flag):-
	process([tập, đoàn, viễn, thông, 'HSBC', luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC', tại, 'Hà', 'Nội', vào, ngày, 30, tháng, 4, năm, 2016], R, Sem, Flag).

ques1(R, Sem, Flag) :- process([ai, luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC'], R, Sem, Flag).
ques1(R, Sem, Flag) :- process([cái, gì, luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC'], R, Sem, Flag).

test_que1(R, Sem, Flag):-
	process([tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC', tại, đâu, vào, khi, nào], R, Sem, Flag).
