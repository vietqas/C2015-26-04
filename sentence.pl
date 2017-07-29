
:-[noun_phrase].
:-[verb_phrase].
:-[quantify_phrase].
:-[place_phrase].
:-[adjective_phrase].
:-[time_phrase].

:-[sf_common_noun].
:-[sf_common_noun].

:-[drawterm].

:-[data_set].

components(Comp) --> [],
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 1')}.

components(Comp) -->
	adjP(SemAdjP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 2')}.
components(Comp) -->
	placeP(SemPlaceP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 3')}.
components(Comp) -->
	timeP(SemTimeP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 4')}.

components(Comp) -->
	adjP(SemAdjP),
	placeP(SemPlaceP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 5')}.
components(Comp) -->
	placeP(SemPlaceP),
	adjP(SemAdjP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 6')}.

components(Comp) -->
	adjP(SemAdjP),
	timeP(SemTimeP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 7')}.
components(Comp) -->
	timeP(SemTimeP),
	adjP(SemAdjP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 8')}.

components(Comp) -->
	placeP(SemPlaceP),
	timeP(SemTimeP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 9')}.
components(Comp) -->
	timeP(SemTimeP),
	placeP(SemPlaceP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 10')}.

components(Comp) -->
	adjP(SemAdjP),
	placeP(SemPlaceP),
	timeP(SemTimeP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 11')}.
components(Comp) -->
	adjP(SemAdjP),
	timeP(SemTimeP),
	placeP(SemPlaceP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 12')}.
components(Comp) -->
	placeP(SemPlaceP),
	timeP(SemTimeP),
	adjP(SemAdjP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 13')}.
components(Comp) -->
	placeP(SemPlaceP),
	adjP(SemAdjP),
	timeP(SemTimeP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 14')}.
components(Comp) -->
	timeP(SemTimeP),
	placeP(SemPlaceP),
	adjP(SemAdjP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 15')}.
components(Comp) -->
	timeP(SemTimeP),
	adjP(SemAdjP),
	placeP(SemPlaceP),
	{Comp = components(SemAdjP, SemPlaceP, SemTimeP),
	writeln('Components. ID: 16')}.


s(SemS) -->
	np(NP),
	vp(NP^VP, VP_Pro),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Sentence. ID: 1')}.

s(SemS) -->
	quaP(QuaP),
	vp(QuaP^VP, VP_Pro),
	components(Comp),
	{SemVP = semVP(semVerb(VP), VP_Pro), SemS = sem(SemVP, Comp),
	 writeln('Sentence. ID: 1')}.

s(SemS) --> sub_sen(Sem), vp(Sem^SemS, Adv).
