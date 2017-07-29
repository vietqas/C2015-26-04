:-[sf_place_cn].
:-[sf_place_pn].

%:- module(place_phrase,[placeP/3]).

loc_word --> [tại]; [ở]; [ở, tại]; [].

placeP(SemPlaceP) --> loc_word, cn_place(CN_Place),
	{SemPlaceP = semPlaceP(frame(CN_Place),_)}.

placeP(SemPlaceP) --> loc_word, pn_place(PN_Place, Meaning),
	{SemPlaceP = semPlaceP(frame(Meaning), PN_Place)}.

placeP(SemPlaceP) --> loc_word, cn_place(PN_Place^CN_Place), pn_place(PN_Place, Meaning),
	{SemPlaceP = semPlaceP(frame(Meaning, CN_Place), PN_Place)}.

placeP(Where, gap(placeP, Where)) -->[].

tp1 :- placeP(S, [tại, thành, phố, 'Hà', 'Nội'], []), draw_term(S).
