
:-[noun_phrase].
:-[sf_num_word_qua].


num(Num) --> [N], {number(N) -> Num = N; !}.
order(order)--> [thứ]; [lần]; [lần, thứ].

quaP(SemQ) --> num(Num), np(SemNP),
	{SemQ = modifyQNP(SemNP, Num), writeln('Luật 1.1')}.

quaP(SemQ) --> num_word(Num), np(SemNP),
	{SemQ = modifyQNP(SemNP, Num), writeln('Luật 1.2')}.

quaP(SemQ) --> qua(Qua), np(SemNP),
	{SemQ = modifyQNP(SemNP, Qua), writeln('Luật 2.1')}.

quaP(SemQ) --> np(SemNP), order(order), num(N),
	{SemQ = modify_Ordinal_NP(SemNP, N), writeln('Luật 3.1')}.


/*
quaP(SemQ) --> qua(Qua), np(SemNP), {SemQ = modifyQNP(SemNP, Qua), writeln('Luật 2')}.
quaP(SemQ) --> np(SemNP), order(order), num(N),
	       {SemQ = modify_Ordinal_NP(SemNP, N), writeln('Luật 3')}.
*/

qua1 :- quaP(SemQ, [mười, chi, nhánh, ngân, hàng, 'HSBC'], []), draw_term(SemQ).
qua2 :- quaP(SemQ, [chi, nhánh, ngân, hàng, 'HSBC', thứ, 2], []), draw_term(SemQ).
qua3 :- quaP(SemQ, [chi, nhánh, ngân, hàng, 'HSBC', lần, 2], []), draw_term(SemQ).
qua4 :- quaP(SemQ, [chi, nhánh, ngân, hàng, 'HSBC', lần, thứ, 2], []), draw_term(SemQ).
qua5 :- quaP(SemQ, [2, chi, nhánh, ngân, hàng, 'HSBC', lần, thứ, 2], []), draw_term(SemQ).
