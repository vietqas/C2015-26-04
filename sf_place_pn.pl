pn_place(['Tiền_Giang'],pn) --> ['Tiền_Giang'].
pn_place(['Cần_Thơ'],pn) --> ['Cần_Thơ'].
pn_place(['test6'],_) --> ['test6'].
pn_place(['Test7'],[c('Test6'), d('Test6')]) --> ['Test7'].
pn_place(['Tiền_Giang'],[tỉnh(['Tiền_Giang'])]) --> ['Tiền_Giang'].
