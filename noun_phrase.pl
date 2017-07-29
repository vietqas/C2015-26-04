

:-[sf_common_noun].
:-[sf_proper_name].
:-[adjective_phrase].

%  [công, ty, 'Viettel']
%  [viễn, thông, 'Viettel']
%  [tập, đoàn, 'Viettel']
%  [tập, đoàn, quân, đội, 'Viettel']

process_to_flatten(Input, Output):- flatten(Input, Temp), list_to_set(Temp, Output).

common_noun(X, Meaning) --> cn(X^Sem),
	{Meaning = [Sem]}.

common_noun(X, Meaning) --> cn(X^Sem1),  cn(X^Sem2),
	{Meaning = [Sem1, Sem2]}.

common_noun(X, Meaning) --> cn(X^Sem1),  cn(X^Sem2),  cn(X^Sem3),
	{Meaning = [Sem1, Sem2, Sem3]}.

np(SemNP) --> common_noun(PN, M),
	{process_to_flatten([M], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np(SemNP) --> pn(PN, Meaning),
	{process_to_flatten([Meaning], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np(SemNP) --> common_noun(PN, M), pn(PN, Meaning),
	{process_to_flatten([M, Meaning], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np(SemNP) --> common_noun(PN, M), pn(PN, Meaning), pn(PN2, Meaning2),
	{process_to_flatten([M, Meaning, Meaning2], Sem),
	 SemNP = semNP(atom(PN, PN2),frame(Sem))}.

np(SemNP) --> common_noun(PN, M1), pn(PN, Meaning), common_noun(PN, M2),
	{process_to_flatten([M1, Meaning, M2], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np(SemNP) --> common_noun(PN, M1), adjP(SemAdjP),
	{process_to_flatten([M1], Sem),
	 SemNP = semNP(atom(PN),frame(Sem), modifyAdjP_NP(SemAdjP))}.

np(SemNP) --> common_noun(PN, M1), pn(PN, Meaning), adjP(SemAdjP),
	{process_to_flatten([M1, Meaning], Sem),
	 SemNP = semNP(atom(PN),frame(Sem), modifyAdjP_NP(SemAdjP))}.


np33(SemNP) --> np_(SemNP_), [của], np(SemNP),
	{SemNP = semNP(poss_của(SemNP_, SemNP))}.

%Từ của:

np_(SemNP) --> common_noun(PN, M),
	{process_to_flatten([M], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np_(SemNP) --> pn(PN, Meaning),
	{process_to_flatten([Meaning], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np_(SemNP) --> common_noun(PN, M), pn(PN, Meaning),
	{process_to_flatten([M, Meaning], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np_(SemNP) --> common_noun(PN, M), pn(PN, Meaning), pn(PN2, Meaning2),
	{process_to_flatten([M, Meaning, Meaning2], Sem),
	 SemNP = semNP(atom(PN, PN2),frame(Sem))}.

np_(SemNP) --> common_noun(PN, M1), pn(PN, Meaning), common_noun(PN, M2),
	{process_to_flatten([M1, Meaning, M2], Sem),
	 SemNP = semNP(atom(PN),frame(Sem))}.

np_(SemNP) --> common_noun(PN, M1), adjP(SemAdjP),
	{process_to_flatten([M1], Sem),
	 SemNP = semNP(atom(PN),frame(Sem), modifyAdjP_NP(SemAdjP))}.

np_(SemNP) --> common_noun(PN, M1), pn(PN, Meaning), adjP(SemAdjP),
	{process_to_flatten([M1, Meaning], Sem),
	 SemNP = semNP(atom(PN),frame(Sem), modifyAdjP_NP(SemAdjP))}.

