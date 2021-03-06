use "C:\Users\Hendrix\Downloads\J-DONNEES.dta"
drop DAM DAM_G1 DAM_G01 DAM_G02 DAM_G04 DAM_G05 DAM_G051 DAM_G06 DAM_G061 DAM_G062 DAM_G07 DAM_G071 DAM_G081 DAM_G082 DAM_G083 DAM_G084 DAM_G09 DAM_G091 DAM_G092 DAM_G11 DAM_G111 DAM_G112 DAM_G13 DAM_G131 DAM_G132 DAM_G2 DAM_G3 DAM_G31 DAM_G32 DAM_G4 DAM_G08 
graph box DAM_G072
reg DAM_G072 i.Milieu i.Région_12 Taille_ménage i.Sexe_CM i.Age_quin_CM i.Etat_matrimonial_CM i.Niveau_scolaire_agreg_CM i.Situation_profession_agreg_CM
predict d, cooksd
drop if d>4/(15470-41-1)
reg DAM_G072 i.Milieu i.Région_12 Taille_ménage i.Sexe_CM i.Age_quin_CM i.Etat_matrimonial_CM i.Niveau_scolaire_agreg_CM i.Situation_profession_agreg_CM
anova DAM_G072 Milieu Région_12 Sexe_CM Age_quin_CM Etat_matrimonial_CM Niveau_scolaire_agreg_CM Situation_profession_agreg_CM
ssc install vselect
xi:vselect DAM_G072 i.Milieu i.Région_12 Taille_ménage  i.Age_quin_CM i.Etat_matrimonial_CM i.Niveau_scolaire_agreg_CM i.Situation_profession_agreg_CM, forward bic
predict yhat, xb
predict res_stand, rstand
pnorm res_stand
sktest res_stand
swilk res_stand
estat hettest
regress DAM_G072 _IRégion_1_7 Taille_ménage  _IRégion_1_11   _IRégion_1_5   _IRégion_1_9 _IRégion_1_10    _IMilieu_2   _IRégion_1_6  _IEtat_matr_2 _IRégion_1_8  _IRégion_1_2  _IRégion_1_3  _IRégion_1_4  _IRégion_1_12 _INiveau_sc_5  _IAge_quin__5 _INiveau_sc_3 _IAge_quin__6  _INiveau_sc_6 _ISituation_4  _ISituation_1 _INiveau_sc_4 _IAge_quin__12 _ISituation_9, vce(robust)
gen t=_n
tsset t
estat dwatson
ovtest
