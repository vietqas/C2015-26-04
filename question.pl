:- op(510,xfy,=>).
:-[noun_phrase].
:-[verb_phrase].
:-[quantify_phrase].
:-[place_phrase].
:-[adjective_phrase].
:-[time_phrase].
:-[sf_common_noun].
:-[sf_adv].
:-[sf_common_noun].
:-[sf_adj].
:-[drawterm].

%General:
components(Comp, A, P, T) -->
	adjP(SemAdjP, A),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #01')}.
components(Comp, A, P, T) -->
	placeP(SemPlaceP, P),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #02')}.
components(Comp, A, P, T) -->
	timeP(SemTimeP, T),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #03')}.
components(Comp, A, P, T) -->
	adjP(SemAdjP, A),
	placeP(SemPlaceP, P),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #04')}.
components(Comp, A, P, T) -->
	placeP(SemPlaceP, P),
	adjP(SemAdjP, A),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #05')}.
components(Comp, A, P, T) -->
	adjP(SemAdjP, A),
	timeP(SemTimeP, T),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #06')}.
components(Comp, A, P, T) -->
	timeP(SemTimeP, T),
	adjP(SemAdjP, A),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #07')}.
components(Comp, A, P, T) -->
	placeP(SemPlaceP, P),
	timeP(SemTimeP, T),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #08')}.
components(Comp, A, P, T) -->
	timeP(SemTimeP, T),
	placeP(SemPlaceP, P),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #09')}.

components(Comp, A, P, T) -->
	adjP(SemAdjP, A),
	placeP(SemPlaceP, P),
	timeP(SemTimeP, T),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #10')}.
components(Comp, A, P, T) -->
	adjP(SemAdjP, A),
	timeP(SemTimeP, T),
	placeP(SemPlaceP, P),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #11')}.

components(Comp, A, P, T) -->
	placeP(SemPlaceP, P),
	adjP(SemAdjP, A),
	timeP(SemTimeP, T),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #12')}.
components(Comp, A, P, T) -->
	placeP(SemPlaceP, P),
	timeP(SemTimeP, T),
	adjP(SemAdjP, A),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #13')}.

components(Comp, A, P, T) -->
	timeP(SemTimeP, T),
	placeP(SemPlaceP, P),
	adjP(SemAdjP, A),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #15')}.
components(Comp, A, P, T) -->
	timeP(SemTimeP, T),
	adjP(SemAdjP, A),
	placeP(SemPlaceP, P),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP), writeln('General #16')}.

adjP(X, gap(adjP, X, IP)) --> how_adj(IP).
placeP(X, gap(placeP, X, IP)) --> where(IP).
timeP(X, gap(timeP, X, IP)) --> what_time(IP).

adjP(X, gapp(adjP, X)) --> [].
placeP(X, gapp(placeP, X)) --> [].
timeP(X, gapp(timeP, X)) --> [].

adjP(X, nogap) --> adjP(X).
placeP(X, nogap) --> placeP(X).
timeP(X, nogap) --> timeP(X).

% Class #1
who(Form) -->
	[ai];
	[người, nào];
	[là, ai];
	[nhân, vật, nào];
	[nhân, vật, gì],
	{writeln('1. Class #1: Who')}.

who(Form) -->
	cn(_^Form), ([gì]; [nào]),
	{writeln('2. Class #1: Who')}.
/*
who(Form) -->
	cn(Form), [nào],
	{writeln('3. Class #1: Who')}.*/

% Class #2
what(Form) -->
	[gì];
	[nào];
	[cái, gì];
	[cái, nào],
	{writeln('1. Class #2: What')}.

what(Form) -->
	cn(_^Form), ([gì]; [nào]),
	{writeln('2. Class #2: What')}.

/*what(Form) -->
	cn(Form), [nào],
	{writeln('3. Class #2: What')}.*/

% Class #3
how_qua(fi_infi(_)) -->
	[mấy];
	[bao, nhiêu];
	[khoảng, bao, nhiêu];
	[khoảng, nhiêu];
	{writeln('1. Class #3: how_qua')}.
how_qua(ordinal(_)) -->
	[thứ, mấy];
	[lần, thứ, mấy],
	{writeln('2. Class #3: how_qua')}.

how_qua(fi_infi(Form)) --> [mấy], cn(_^Form), {writeln('3. Class #3: how_qua')}.
how_qua(fi_infi(Form)) --> [khoảng, bao, nhiêu], cn(_^Form), {writeln('3. Class #3: how_qua')}.
how_qua(fi_infi(Form)) --> [bao, nhiêu], cn(_^Form), {writeln('3. Class #3: how_qua')}.
how_qua(fi_infi(Form)) --> [khoảng, nhiêu], cn(_^Form), {writeln('3. Class #3: how_qua')}.

how_qua(ordinal(Form)) --> cn(_^Form), [lần, thứ, mấy],{writeln('4. Class #3: how_qua')}.
how_qua(ordinal(Form)) --> cn(_^Form), [thứ, mấy] ,{writeln('4. Class #3: how_qua')}.
how_qua(ordinal(Form)) --> cn(_^Form), [mấy] ,{writeln('4. Class #3: how_qua')}.

% Class #4
how_adj(_) --> [thế, nào]; [như, thế, nào]; [ra, sao], {writeln('Class #4 How adj. ID: 1')}.
how_adj(mod(SemNP)) --> np(SemNP), ([thế, nào]; [như, thế, nào]; [ra, sao]), {writeln('Class #4 How adj. ID: 1')}.

% Class #5
what_time(_) -->
	[vào, lúc, nào]; [lúc, nào];
	[khi, nào]; [vào, khi, nào]; [lúc]; [khi];
	[thời, gian, nào]; [trong, thời, gian, nào];
	[vào, thời, gian, nào]; [vào, năm, nào],
	{writeln('Class #5: What time. ID: 1')}.

time(_)--> [].
time([ngày])--> [ngày].
time([tháng])--> [tháng].
time([năm])--> [năm].
what_time(T) -->
	(
	[bao, nhiêu];
	[bao, lâu];
	[mấy];
	[trong, mấy];
	[khoảng, nhiêu]
	),
	time(T),
	{writeln('Class #5: What time. ID: 2')}.

% Class #6
where(_) -->
	[đâu];
	[ở, đâu];
	[nơi, nào];
	[chỗ, nào];
	[tại, đâu];
	[vị, trí, nào],
	{writeln('Where. ID: 1')}.

where(Where) --> cn_place(Where), ([nào]; [gì]),
	{writeln('Where. ID: 2')}.

% Class #7
yn_que(yn) --> [].
yn_que(yn) -->
	[có, phải];
	[phải, không];
	[đúng, không];
	[không];
	[hay, không];
	[có, phải, không].
yes_no_HEAD(yn) --> [có, phải];
	        [].

yes_no_TAIL(yn) --> [đúng, không];
                [phải, không];
	        [không];
	        [có, phải, không];
	        [hay, không].

np(X, gap(np, X)) -->[].
quaP(X, gap(quaP, X)) -->[].


%For NP vp(NP^VP, VP_Pro)
/*
s(SemS) --> np(NP), vp(NP^VP, VP_Pro), components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Sentence. ID: 1')}.
vp(SemV, VP_Pro, gap(np, X))

*/

%Class #1
q(answer(X, who(Mean)) => SemS) -->
	who(Mean), np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.0')}.

q(answer(X, who(Mean)) => SemS) -->
	np(NP),
	vp(NP^VP, VP_Pro, gap(np, X)), who(Mean),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.1')}.

%Class #2
q(answer(X, what(Mean)) => SemS) -->
	what(Mean), np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #2. Question. ID: 2.0')}.

q(answer(X, what(Mean)) => SemS) -->
	np(NP),
	vp(NP^VP, VP_Pro, gap(np, X)), what(Mean),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #2. Question. ID: 2.1')}.

%Class #3: How qua


q(answer(X, how_qua(Mean)) => SemS) -->
	how_qua(Mean), quaP(X, gap(quaP, X)),
	vp(X^VP, VP_Pro),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #3. Question. ID: 3.0')}.

q(answer(X, how_qua(Mean)) => SemS) -->
	np(NP),
	vp(NP^VP, VP_Pro, gap(quaP, X)), how_qua(Mean),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #3. Question. ID: 3.1')}.

% Class #4
que(answer(X, how_adj(IP)) => SemS) -->
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, gap(adjP, X, IP), nogap, nogap),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('How adj Question. ID: 4.1. Hi vọng')}.

que(answer(X, how_adj(IP)) => SemS) -->
	how_qua(IP),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, gapp(adjP, X), nogap, nogap),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('How adj Question. ID: 4.2. Hi vọng')}.

%Class #5: What time
que(answer(X, what_time(IP)) => SemS) -->
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, nogap, gap(timeP, X, IP)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 5.1. Hi vọng')}.

que(answer(X, what_time(IP)) => SemS) -->
	what_time(IP),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, nogap, gapp(timeP, X)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 5.2. Hi vọng')}.

%Class #6: Where
que(answer(X, where(IP)) => SemS) -->
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, gap(placeP, X, IP), nogap),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 6.1. Hi vọng')}.

que(answer(X, where(IP)) => SemS) -->
	where(IP),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, gapp(placeP, X), nogap),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 6.2. Hi vọng')}.

%Class #7: Yes-No Question
que(answer(['Đúng'], yes_no) => SemS) -->
	yes_no_HEAD(yn),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp),
	yes_no_TAIL(yn),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Yes-No Question. ID: 7.1')}.
/*
que(answer(['Đúng'], yes_no) => SemS) -->
	yes_no_HEAD(yn),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, nogap, nogap),
	yes_no_TAIL(yn),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Yes-No Question. ID: 7.2')}.
*/

%Class #8
%What time - Where
que(answer(two(X,Y), qc(IP_place, IP_time)) => SemS) -->
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, gap(placeP, X, IP_place), gap(timeP, Y, IP_time)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 8.1. Hi vọng')}.

que(answer(two(X,Y), qc(IP_place, IP_time)) => SemS) -->
	what_time(IP_place), where(IP_time),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, gapp(placeP, X), gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 8.2. Hi vọng')}.

que(answer(two(X,Y), qc(IP_place, IP_time)) => SemS) -->
	what_time(IP_time),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, gap(placeP, X, IP_place), gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 8.3. Hi vọng')}.

que(answer(two(X,Y), qc(IP_place, IP_time)) => SemS) -->
        where(IP_place),
	np(NP), vp(NP^VP, VP_Pro),
	components(Comp, nogap, gapp(placeP, X), gap(timeP, Y, IP_time)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('What_time Question. ID: 8.4. Hi vọng')}.

%Who  -  What time
que(answer(two(X, Y), who_time(Mean, IP)) => SemS) -->
	who(Mean),
	np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp, nogap, nogap, gap(timeP, Y, IP)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.0')}.

que(answer(two(X, Y), who_time(Mean, IP)) => SemS) -->
	who(Mean),
	what_time(IP),
	np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp, nogap, nogap, gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.0')}.
que(answer(two(X, Y), who_time(Mean, IP)) => SemS) -->
	what_time(IP),
	who(Mean),
	np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp, nogap, nogap, gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.0')}.

que(answer(two(X, Y), who_time(Mean, IP)) => SemS) -->
	what_time(IP),
	np(NP),
	vp(NP^VP, VP_Pro, gap(np, X)), who(Mean),
	components(Comp, nogap, nogap, gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.1')}.
que(answer(two(X, Y), who_time(Mean, IP)) => SemS) -->
	np(NP),
	vp(NP^VP, VP_Pro, gap(np, X)), who(Mean),
	components(Comp, nogap, nogap, gap(timeP, Y, IP)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.1')}.

%What  -  What time
que(answer(two(X, Y), what_What_time(Mean, IP)) => SemS) -->
	what(Mean),
	np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp, nogap, nogap, gap(timeP, Y, IP)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.0')}.

que(answer(two(X, Y), what_What_time(Mean, IP)) => SemS) -->
	what(Mean),
	what_time(IP),
	np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp, nogap, nogap, gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.0')}.
que(answer(two(X, Y), what_What_time(Mean, IP)) => SemS) -->
	what_time(IP),
	what(Mean),
	np(X, gap(np, X)),
	vp(X^VP, VP_Pro),
	components(Comp, nogap, nogap, gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.0')}.

que(answer(two(X, Y), what_What_time(Mean, IP)) => SemS) -->
	what_time(IP),
	np(NP),
	vp(NP^VP, VP_Pro, gap(np, X)), what(Mean),
	components(Comp, nogap, nogap, gapp(timeP, Y)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.1')}.
que(answer(two(X, Y), what_What_time(Mean, IP)) => SemS) -->
	np(NP),
	vp(NP^VP, VP_Pro, gap(np, X)), what(Mean),
	components(Comp, nogap, nogap, gap(timeP, Y, IP)),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Class #1. Question. ID: 1.1')}.

%Class #




seekFrame(NP2, SemV, NP2) --> np(NP1), v(NP1^NP2^SemV, S), np(NP2),
	{SemVP = semVP(semVerb(VP), Adv), SemS = sem(SemVP, Comp),
	 writeln('Seek Frame. ID: 4')}.

% q(A, [ai, luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC'], []).
% [tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC']
% % q(A, [khi, nào, tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng, ngân, hàng, quốc, tế, 'HSBC', tại, đâu], []).
% q(Sem, [tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng,ngân,hàng, quốc, tế, 'HSBC', vào, khi, nào], []).
% q(Sem, [vào, khi, nào, tập, đoàn, viễn, thông, 'Viettel', luôn, luôn, xây, dựng,ngân,hàng, quốc, tế, 'HSBC'], []).

