/*Sintax*/

/*Age and sex*/

gen idade=AGE_YR

label var idade "Idade em anos"

gen idade_ct=.

label var idade_ct "Idade por categoria"

replace idade_ct=1 if AGE_CAT==1

replace idade_ct=2 if AGE_CAT==2

replace idade_ct=3 if AGE_CAT==3

replace idade_ct=4 if AGE_CAT==4

replace idade_ct=5 if AGE_CAT==5

gen idade1=.

label var idade1 "16 a 24 anos"

replace idade1=1 if idade_ct==1

replace idade1=0 if idade_ct==2 | idade_ct==3 | idade_ct==4 | idade_ct==5

gen idade2=.

label var idade2 "25 a 34 anos"

replace idade2=1 if idade_ct==2

replace idade2=0 if idade_ct==1 | idade_ct==3 | idade_ct==4 | idade_ct==5

gen idade3=.

label var idade3 "35 a 44 anos"

replace idade3=1 if idade_ct==3

replace idade3=0 if idade_ct==2 | idade_ct==1 | idade_ct==4 | idade_ct==5

gen idade4=.

label var idade4 "45 a 59 anos"

replace idade4=1 if idade_ct==4

replace idade4=0 if idade_ct==2 | idade_ct==3 | idade_ct==1 | idade_ct==5

gen idade5=.

label var idade5 "Mais de 60 anos"

replace idade5=1 if idade_ct==5

replace idade5=0 if idade_ct==2 | idade_ct==3 | idade_ct==4 | idade_ct==1

gen sexo=.

label var sexo "Sexo"

replace sexo=0 if SEX==2 /*feminino*/

replace sexo=1 if SEX==1 /*masculino*/


/*Homossexuality e abortion*/

gen uniaohomo=.

label var uniaohomo "Contra ou a favor da legalização da união entre pessoas do mesmo sexo"

replace uniaohomo=0 if LEGSSMAR==2 /*contra*/

replace uniaohomo=1 if LEGSSMAR==1 /*a favor*/

gen adocaohomo=.

label var adocaohomo "Contra ou a favor da adoção de crianças por casais homossexuais"

replace adocaohomo=0 if ADPTHOMO==2 /*contra*/

replace adocaohomo=1 if ADPTHOMO==1 /*a favor*/

gen aborto =.

label var aborto "Contra ou a favor de modificar lei do aborto"

replace aborto=0 if FAVORABT==1 /*contra*/

replace aborto=1 if FAVORABT==2 /*a favor*/


/*Religion*/

gen rel_atual=.

label var rel_atual "Religião do entrevistado no momento da pesquisa"

replace rel_atual=1 if YOURRLGN==1 /*pentecostal*/

replace rel_atual=2 if YOURRLGN==2 /*não pentecostal*/

replace rel_atual=3 if YOURRLGN==3 | YOURRLGN==4 /* afro*/

replace rel_atual=4 if YOURRLGN==5 /*espírita*/

replace rel_atual=5 if YOURRLGN==6 /*católica*/

replace rel_atual=6 if YOURRLGN==7 /*judaica*/

replace rel_atual=7 if YOURRLGN==8 /*outras*/

replace rel_atual=8 if YOURRLGN==9 /*sem religião*/

gen r_evp=.

label var r_evp "Religião do entrevistado - Evangélica Pentecostal"

replace r_evp=1 if rel_atual==1

replace r_evp=0 if rel_atual==2 | rel_atual==3 | rel_atual==4 | rel_atual==5 | rel_atual==6 | rel_atual==7 | rel_atual==8

gen r_evnp=.

label var r_evnp "Religião do entrevistado - Evangélica NÃO Pentecostal"

replace r_evnp=1 if rel_atual==2

replace r_evnp=0 if rel_atual==1 | rel_atual==3 | rel_atual==4 | rel_atual==5 | rel_atual==6 | rel_atual==7 | rel_atual==8

gen r_afro=.

label var r_afro "Religião do entrevistado - Religiões Afrobrasileiras"

replace r_afro=1 if rel_atual==3

replace r_afro=0 if rel_atual==2 | rel_atual==1 | rel_atual==4 | rel_atual==5 | rel_atual==6 | rel_atual==7 | rel_atual==8

gen r_esp=.

label var r_esp "Religião do entrevistado - Espírita"

replace r_esp=1 if rel_atual==4

replace r_esp=0 if rel_atual==2 | rel_atual==3 | rel_atual==1 | rel_atual==5 | rel_atual==6 | rel_atual==7 | rel_atual==8

gen r_cat=.

label var r_cat "Religião do entrevistado - Católica"

replace r_cat=1 if rel_atual==5

replace r_cat=0 if rel_atual==2 | rel_atual==3 | rel_atual==4 | rel_atual==1 | rel_atual==6 | rel_atual==7 | rel_atual==8

gen r_judeu=.

label var r_judeu "Religião do entrevistado - Judaica"

replace r_judeu=1 if rel_atual==6

replace r_judeu=0 if rel_atual==2 | rel_atual==3 | rel_atual==4 | rel_atual==5 | rel_atual==1 | rel_atual==7 | rel_atual==8

gen r_outras=.

label var r_outras "Religião do entrevistado - Outras"

replace r_outras=1 if rel_atual==7

replace r_outras=0 if rel_atual==2 | rel_atual==3 | rel_atual==4 | rel_atual==5 | rel_atual==6 | rel_atual==1 | rel_atual==8

gen sem_rel=.

label var sem_rel "Religião do entrevistado - Nenhuma"

replace sem_rel=1 if rel_atual==8

replace sem_rel=0 if rel_atual==2 | rel_atual==3 | rel_atual==4 | rel_atual==5 | rel_atual==6 | rel_atual==7 | rel_atual==1

gen rel_ant=.

label var rel_ant "Qual era sua religião anterior"

replace rel_ant=1 if PREVRLGN==1 | (YOURRLGN==1 & ALWYSFOL==1) /*pentecostal*/

replace rel_ant=2 if PREVRLGN==2 | (YOURRLGN==2 & ALWYSFOL==1) /*não pentecostal*/

replace rel_ant=3 if (PREVRLGN==3 | PREVRLGN==4) | (rel_atual==3 & ALWYSFOL==1) /* afro*/

replace rel_ant=4 if PREVRLGN==5 | (YOURRLGN==5 & ALWYSFOL==1) /*espírita*/

replace rel_ant=5 if PREVRLGN==6 | (YOURRLGN==6 & ALWYSFOL==1) /*católica*/

replace rel_ant=6 if YOURRLGN==7 & ALWYSFOL==1 /*judaica*/

replace rel_ant=7 if PREVRLGN==8 | (YOURRLGN==8 & ALWYSFOL==1) /*outras*/

replace rel_ant=8 if PREVFOL==2 | ANYRLGN==2 /*sem religião*/

gen r_a_evp=.

label var r_a_evp "Religião anterior do entrevistado - Evangélica Pentecostal"

replace r_a_evp=1 if rel_ant==1

replace r_a_evp=0 if rel_ant==2 | rel_ant==3 | rel_ant==4 | rel_ant==5 | rel_ant==6 | rel_ant==7 | rel_ant==8

gen r_a_evnp=.

label var r_a_evnp "Religião anterior do entrevistado - Evangélica NÃO Pentecostal"

replace r_a_evnp=1 if rel_ant==2

replace r_a_evnp=0 if rel_ant==1 | rel_ant==3 | rel_ant==4 | rel_ant==5 | rel_ant==6 | rel_ant==7 | rel_ant==8

gen r_a_afro=.

label var r_a_afro "Religião anterior do entrevistado - Religiões Afrobrasileiras"

replace r_a_afro=1 if rel_ant==3

replace r_a_afro=0 if rel_ant==2 | rel_ant==1 | rel_ant==4 | rel_ant==5 | rel_ant==6 | rel_ant==7 | rel_ant==8

gen r_a_esp=.

label var r_a_esp "Religião anterior do entrevistado - Espírita"

replace r_a_esp=1 if rel_ant==4

replace r_a_esp=0 if rel_ant==2 | rel_ant==3 | rel_ant==1 | rel_ant==5 | rel_ant==6 | rel_ant==7 | rel_ant==8

gen r_a_cat=.

label var r_a_cat "Religião anterior do entrevistado - Católica"

replace r_a_cat=1 if rel_ant==5

replace r_a_cat=0 if rel_ant==2 | rel_ant==3 | rel_ant==4 | rel_ant==1 | rel_ant==6 | rel_ant==7 | rel_ant==8

gen r_a_judeu=.

label var r_a_judeu "Religião anterior do entrevistado - Judaica"

replace r_a_judeu=1 if rel_ant==6

replace r_a_judeu=0 if rel_ant==2 | rel_ant==3 | rel_ant==4 | rel_ant==5 | rel_ant==1 | rel_ant==7 | rel_ant==8

gen r_a_outras=.

label var r_a_outras "Religião anterior do entrevistado - Outras"

replace r_a_outras=1 if rel_ant==7

replace r_a_outras=0 if rel_ant==2 | rel_ant==3 | rel_ant==4 | rel_ant==5 | rel_ant==6 | rel_ant==1 | rel_ant==8

gen sem_rel_a=.

label var sem_rel_a "Religião anterior do entrevistado - Nenhuma"

replace sem_rel_a=1 if rel_ant==8

replace sem_rel_a=0 if rel_ant==2 | rel_ant==3 | rel_ant==4 | rel_ant==5 | rel_ant==6 | rel_ant==7 | rel_ant==1


/*Apostasy*/

gen apostata=.

label var apostata "Desfiliados"

replace apostata=0 if ALWYSFOL==1 | PREVFOL==1

replace apostata=1 if (rel_ant==1 | rel_ant==2 | rel_ant==3 | rel_ant==4 | rel_ant==5 | rel_ant==6 | rel_ant==7) & rel_atual==8


/*Absence of religious pratice*/

gen naofrequenta=.

label var naofrequenta "Com que frequência vai à igreja"

replace naofrequenta=1 if ATTENDCH==1

replace naofrequenta=2 if ATTENDCH==2

replace naofrequenta=3 if ATTENDCH==3

replace naofrequenta=4 if ATTENDCH==4

replace naofrequenta=5 if ATTENDCH==5

replace naofrequenta=6 if ATTENDCH==6

replace naofrequenta=7 if ATTENDCH==7

replace naofrequenta=8 if ATTENDCH==96

gen naoreza=.

label var naoreza "Se costuma orar, com que frequência"

replace naoreza=1 if OFTNPRAY==1

replace naoreza=2 if OFTNPRAY==2

replace naoreza=3 if OFTNPRAY==3

replace naoreza=4 if OFTNPRAY==4

replace naoreza=5 if OFTNPRAY==5

replace naoreza=6 if OFTNPRAY==6

replace naoreza=7 if OFTNPRAY==96


/*Contact with religion during childhood*/

gen est_inst_rel=.

label var est_inst_rel "Se já estudou em instituição religiosa"

replace est_inst_rel=0 if RELIGEDU==3

replace est_inst_rel=1 if RELIGEDU==2

replace est_inst_rel=1 if RELIGEDU==1


/*Disbelief*/

gen Deusexiste=.

label var Deusexiste "Acredita que Deus existe"

replace Deusexiste=0 if GODEXIST==1

replace Deusexiste=1 if GODEXIST==2

gen ceu=.

label var ceu "Acredita que algumas pessoas quando morrem vão para o céu"

replace ceu=0 if HEAVEN==1

replace ceu=1 if HEAVEN==2

gen inferno=.

label var inferno "Acredita que algumas pessoas quando morrem vão para o inferno"

replace inferno=0 if HELL==1

replace inferno=1 if HELL==2


/*Contact with people from other religions*/

gen casouinterrel=.

label var casouinterrel "Se já namorou ou casou com alguém de outra religião"

replace casouinterrel=0 if DTDDIFRL==1 | DTDDIFRL==2

replace casouinterrel=1 if DTDDIFRL==3


/*Socioeconomic*/

gen casado=.

label var casado "Se é casado ou não"

replace casado=0 if MARSTAT==1 | MARSTAT==3 | MARSTAT==4

replace casado=1 if MARSTAT==2

gen municipio=.

label var municipio "Característica do município"

replace municipio=1 if METROP==1 | METROP==2

replace municipio=0 if METROP==3

gen regiao=.

label var regiao "Regiões"

replace regiao=1 if REGION==1

replace regiao=2 if REGION==2

replace regiao=3 if REGION==3

replace regiao=4 if REGION==4

gen sudeste=.

replace sudeste=1 if REGION==1

replace sudeste=0 if REGION==2 | REGION==3 | REGION==4

gen sul=.

replace sul=1 if REGION==2

replace sul=0 if REGION==1 | REGION==3 | REGION==4

gen nordeste=.

replace nordeste=1 if REGION==3

replace nordeste=0 if REGION==1 | REGION==2 | REGION==4

gen norte_co=.

replace norte_co=1 if REGION==4

replace norte_co=0 if REGION==2 | REGION==3 | REGION==1

gen pea=.

label var pea "Se faz parte da PEA"

replace pea=1 if PEA==1 | PEA==2 | PEA==3 | PEA==4 | PEA==5 | PEA==6 | PEA==7 | PEA==8 | PEA==9 | PEA==10

replace pea=0 if PEA==11 | PEA==12 | PEA==13 | PEA==14 | PEA==15 | PEA==16

gen escolaridade=.

label var escolaridade "Grau de escolaridade"

replace escolaridade=1 if SCHOOL==1

replace escolaridade=2 if SCHOOL==2 | SCHOOL==3

replace escolaridade=3 if SCHOOL==4 | SCHOOL==5

replace escolaridade=4 if SCHOOL==6 | SCHOOL==7 | SCHOOL==8

gen analfabeto=.

label var analfabeto "Analfabeto"

replace analfabeto=1 if escolaridade==1

replace analfabeto=0 if escolaridade==2 | escolaridade==3 | escolaridade==4

gen ens_fundamental=.

label var ens_fundamental "Ensino fundamental completo ou incompleto"

replace ens_fundamental=1 if escolaridade==2

replace ens_fundamental=0 if escolaridade==1 | escolaridade==3 | escolaridade==4

gen ens_medio=.

label var ens_medio "Ensino Médio completo ou incompleto"

replace ens_medio=1 if escolaridade==3

replace ens_medio=0 if escolaridade==2 | escolaridade==1 | escolaridade==4

gen ens_superior=.

label var ens_superior "Ensino Superior completo ou incompleto / pós-graduação"

replace ens_superior=1 if escolaridade==4

replace ens_superior=0 if escolaridade==2 | escolaridade==3 | escolaridade==1

gen renda=.

label var renda "Renda de todos que moram na casa"

replace renda=1 if FAMILYIN==1

replace renda=2 if FAMILYIN==2 | FAMILYIN==3

replace renda=3 if FAMILYIN==4

replace renda=4 if FAMILYIN==5 | FAMILYIN==6 | FAMILYIN==7

gen renda1=.

label var renda1 "Até dois salários mínimos"

replace renda1=1 if renda==1

replace renda1=0 if renda==2 | renda==3 | renda==4

gen renda2=.

label var renda2 "Entre dois e cinco salários mínimos"

replace renda2=1 if renda==2

replace renda2=0 if renda==1 | renda==3 | renda==4

gen renda3=.

label var renda3 "Entre cinco e dez salários mínimos"

replace renda3=1 if renda==3

replace renda3=0 if renda==2 | renda==1 | renda==4

gen renda4=.

label var renda4 "Mais de dez salários mínimos"

replace renda4=1 if renda==4

replace renda4=0 if renda==2 | renda==3 | renda==1


/*Descriptives*/

summarize sexo uniaohomo adocaohomo aborto apostata naofrequenta naoreza est_inst_rel Deusexiste ceu inferno casouinter
> rel casado municipio sudeste sul nordeste norte_co pea analfabeto ens_fundamental ens_medio ens_superior renda1 renda2 
> renda3 renda4 idade1 idade2 idade3 idade4 idade5 r_evp r_evnp r_cat sem_rel r_a_evp r_a_evnp r_a_cat sem_rel_a
