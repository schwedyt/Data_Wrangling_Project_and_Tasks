# import DIQ_I.csv after exporting from R
# create all columns NULLable

SELECT TOP 10 * FROM tschwedhelm.DIQ_I
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN __

#Column _SEQN_
SELECT COUNT (_SEQN_) FROM tschwedhelm.DIQ_I 
SELECT DISTINCT COUNT (_SEQN_) FROM tschwedhelm.DIQ_I 
# shows that there are no duplicate ID numbers
EXEC sp_rename 'tschwedhelm.DIQ_I._SEQN_', 'ID', 'COLUMN'

#Column _DIQ010_
UPDATE tschwedhelm.DIQ_I SET _DIQ010_ = 'YES' WHERE _DIQ010_ = '1'
SELECT COUNT (_DIQ010_) FROM tschwedhelm.DIQ_I WHERE _DIQ010_ = 'YES'
#856
UPDATE tschwedhelm.DIQ_I SET _DIQ010_ = 'NO' WHERE _DIQ010_ = '2'
SELECT COUNT (_DIQ010_) FROM tschwedhelm.DIQ_I WHERE _DIQ010_ = 'NO'
#8568
UPDATE tschwedhelm.DIQ_I SET _DIQ010_ = 'BORDERLINE' WHERE _DIQ010_ = '3'
SELECT COUNT (_DIQ010_) FROM tschwedhelm.DIQ_I WHERE _DIQ010_ = 'BORDERLINE'
#147
UPDATE tschwedhelm.DIQ_I SET _DIQ010_ = 'REFUSED' WHERE _DIQ010_ = '7'
SELECT COUNT (_DIQ010_) FROM tschwedhelm.DIQ_I WHERE _DIQ010_ = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET _DIQ010_ = 'DONT KNOW' WHERE _DIQ010_ = '9'
SELECT COUNT (_DIQ010_) FROM tschwedhelm.DIQ_I WHERE _DIQ010_ = 'DONT KNOW'
#4
UPDATE tschwedhelm.DIQ_I SET _DIQ010_ = NULL WHERE _DIQ010_ = 'NA'
SELECT COUNT (_DIQ010_) FROM tschwedhelm.DIQ_I WHERE _DIQ010_ = NULL
#0
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ010_', 'dr_DM', 'COLUMN'

#Column _DID040_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID040_', 'DM_age', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD DM_age_approx nvarchar(50) NULL
UPDATE tschwedhelm.DIQ_I SET DM_age = NULL WHERE DM_age = 'NA'
#8722
UPDATE tschwedhelm.DIQ_I SET DM_age_approx = '80' WHERE DM_age = '80'
UPDATE tschwedhelm.DIQ_I SET DM_age = NULL WHERE DM_age = '80'
#7
UPDATE tschwedhelm.DIQ_I SET DM_age_approx = '1' WHERE DM_age = '666'
UPDATE tschwedhelm.DIQ_I SET DM_age = NULL WHERE DM_age = '666'
#1
UPDATE tschwedhelm.DIQ_I SET DM_age_approx = 'REFUSED' WHERE DM_age = '777'
UPDATE tschwedhelm.DIQ_I SET DM_age = NULL WHERE DM_age = '777'
#0
UPDATE tschwedhelm.DIQ_I SET DM_age_approx = 'DONT KNOW' WHERE DM_age = '999'
UPDATE tschwedhelm.DIQ_I SET DM_age = NULL WHERE DM_age = '999'
#12
ALTER TABLE tschwedhelm.DIQ_I ALTER COLUMN DM_age int
# to make ages numeric and able to be analyzed
SELECT COUNT (DM_age) FROM tschwedhelm.DIQ_I
#833 values that have an actual age

#Column _DIQ160_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ160_', 'PreDM', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET PreDM = 'YES' WHERE PreDM = '1'
SELECT COUNT (PreDM) FROM tschwedhelm.DIQ_I WHERE PreDM = 'YES'
#513
UPDATE tschwedhelm.DIQ_I SET PreDM = 'NO' WHERE PreDM = '2'
SELECT COUNT (PreDM) FROM tschwedhelm.DIQ_I WHERE PreDM = 'NO'
#5521
UPDATE tschwedhelm.DIQ_I SET PreDM = 'REFUSED' WHERE PreDM = '7'
SELECT COUNT (PreDM) FROM tschwedhelm.DIQ_I WHERE PreDM = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET PreDM = 'DONT KNOW' WHERE PreDM = '9'
SELECT COUNT (PreDM) FROM tschwedhelm.DIQ_I WHERE PreDM = 'DONT KNOW'
#11
UPDATE tschwedhelm.DIQ_I SET PreDM = NULL WHERE PreDM = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE PreDM IS NULL
#3530

#Column _DIQ170_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ170_', 'DM_health_risk', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET DM_health_risk = 'YES' WHERE DM_health_risk = '1'
SELECT COUNT (DM_health_risk) FROM tschwedhelm.DIQ_I WHERE DM_health_risk = 'YES'
#899
UPDATE tschwedhelm.DIQ_I SET DM_health_risk = 'NO' WHERE DM_health_risk = '2'
SELECT COUNT (DM_health_risk) FROM tschwedhelm.DIQ_I WHERE DM_health_risk = 'NO'
#5268
UPDATE tschwedhelm.DIQ_I SET DM_health_risk = 'REFUSED' WHERE DM_health_risk = '7'
SELECT COUNT (DM_health_risk) FROM tschwedhelm.DIQ_I WHERE DM_health_risk = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET DM_health_risk = 'DONT KNOW' WHERE DM_health_risk = '9'
SELECT COUNT (DM_health_risk) FROM tschwedhelm.DIQ_I WHERE DM_health_risk = 'DONT KNOW'
#19
UPDATE tschwedhelm.DIQ_I SET DM_health_risk = NULL WHERE DM_health_risk = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE DM_health_risk IS NULL
#3389

#Column _DIQ172_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ172_', 'DM_risk', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET DM_risk = 'YES' WHERE DM_risk = '1'
SELECT COUNT (DM_risk) FROM tschwedhelm.DIQ_I WHERE DM_risk = 'YES'
#1588
UPDATE tschwedhelm.DIQ_I SET DM_risk = 'NO' WHERE DM_risk = '2'
SELECT COUNT (DM_risk) FROM tschwedhelm.DIQ_I WHERE DM_risk = 'NO'
#4510
UPDATE tschwedhelm.DIQ_I SET DM_risk = 'REFUSED' WHERE DM_risk = '7'
SELECT COUNT (DM_risk) FROM tschwedhelm.DIQ_I WHERE DM_risk = 'REFUSED'
#1
UPDATE tschwedhelm.DIQ_I SET DM_risk = 'DONT KNOW' WHERE DM_risk = '9'
SELECT COUNT (DM_risk) FROM tschwedhelm.DIQ_I WHERE DM_risk = 'DONT KNOW'
#87
UPDATE tschwedhelm.DIQ_I SET DM_risk = NULL WHERE DM_risk = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE DM_risk IS NULL
#3389

#Column _DIQ175A_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175A_', 'Risk_FH', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_FH = 'YES' WHERE Risk_FH = '10'
SELECT COUNT (Risk_FH) FROM tschwedhelm.DIQ_I WHERE Risk_FH = 'YES'
#1186
UPDATE tschwedhelm.DIQ_I SET Risk_FH = 'REFUSED' WHERE Risk_FH = '77'
SELECT COUNT (Risk_FH) FROM tschwedhelm.DIQ_I WHERE Risk_FH = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET Risk_FH = 'DONT KNOW' WHERE Risk_FH = '99'
SELECT COUNT (Risk_FH) FROM tschwedhelm.DIQ_I WHERE Risk_FH = 'DONT KNOW'
#0
UPDATE tschwedhelm.DIQ_I SET Risk_FH = NULL WHERE Risk_FH = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_FH IS NULL
#8389

#Column _DIQ175B_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175B_', 'Risk_Weight', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Weight = 'YES' WHERE Risk_Weight = '11'
SELECT COUNT (Risk_Weight) FROM tschwedhelm.DIQ_I WHERE Risk_Weight = 'YES'
#601
UPDATE tschwedhelm.DIQ_I SET Risk_Weight = NULL WHERE Risk_Weight = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Weight IS NULL
#8974

#Column _DIQ175C_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175C_', 'Risk_Age', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Age = 'YES' WHERE Risk_Age = '12'
SELECT COUNT (Risk_Age) FROM tschwedhelm.DIQ_I WHERE Risk_Age = 'YES'
#160
UPDATE tschwedhelm.DIQ_I SET Risk_Age = NULL WHERE Risk_Age = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Age IS NULL
#9415

#Column _DIQ175D_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175D_', 'Risk_Diet', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Diet = 'YES' WHERE Risk_Diet = '13'
SELECT COUNT (Risk_Diet) FROM tschwedhelm.DIQ_I WHERE Risk_Diet = 'YES'
#459
UPDATE tschwedhelm.DIQ_I SET Risk_Diet = NULL WHERE Risk_Diet = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Diet IS NULL
#9116

#Column _DIQ175E_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175E_', 'Risk_Race', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Race = 'YES' WHERE Risk_Race = '14'
SELECT COUNT (Risk_Race) FROM tschwedhelm.DIQ_I WHERE Risk_Race = 'YES'
#155
UPDATE tschwedhelm.DIQ_I SET Risk_Race = NULL WHERE Risk_Race = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Race IS NULL
#9420

#Column _DIQ175F_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175F_', 'Risk_Baby', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Baby = 'YES' WHERE Risk_Baby = '15'
SELECT COUNT (Risk_Baby) FROM tschwedhelm.DIQ_I WHERE Risk_Baby = 'YES'
#53
UPDATE tschwedhelm.DIQ_I SET Risk_Baby = NULL WHERE Risk_Baby = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Baby IS NULL
#9522

#Column _DIQ175G_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175G_', 'Risk_NoPhysAct', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_NoPhysAct = 'YES' WHERE Risk_NoPhysAct = '16'
SELECT COUNT (Risk_NoPhysAct) FROM tschwedhelm.DIQ_I WHERE Risk_NoPhysAct = 'YES'
#280
UPDATE tschwedhelm.DIQ_I SET Risk_NoPhysAct = NULL WHERE Risk_NoPhysAct = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_NoPhysAct IS NULL
#9295

#Column _DIQ175H_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175H_', 'Risk_BP', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_BP = 'YES' WHERE Risk_BP = '17'
SELECT COUNT (Risk_BP) FROM tschwedhelm.DIQ_I WHERE Risk_BP = 'YES'
#258
UPDATE tschwedhelm.DIQ_I SET Risk_BP = NULL WHERE Risk_BP = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_BP IS NULL
#9317

#Column _DIQ175I_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175I_', 'Risk_HSugar', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_HSugar = 'YES' WHERE Risk_HSugar = '18'
SELECT COUNT (Risk_HSugar) FROM tschwedhelm.DIQ_I WHERE Risk_HSugar = 'YES'
#77
UPDATE tschwedhelm.DIQ_I SET Risk_HSugar = NULL WHERE Risk_HSugar = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_HSugar IS NULL
#9498

#Column _DIQ175J_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175J_', 'Risk_Chol', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Chol = 'YES' WHERE Risk_Chol = '19'
SELECT COUNT (Risk_Chol) FROM tschwedhelm.DIQ_I WHERE Risk_Chol = 'YES'
#150
UPDATE tschwedhelm.DIQ_I SET Risk_Chol = NULL WHERE Risk_Chol = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Chol IS NULL
#9425

#Column _DIQ175K_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175K_', 'Risk_LSugar', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_LSugar = 'YES' WHERE Risk_LSugar = '20'
SELECT COUNT (Risk_LSugar) FROM tschwedhelm.DIQ_I WHERE Risk_LSugar = 'YES'
#31
UPDATE tschwedhelm.DIQ_I SET Risk_LSugar = NULL WHERE Risk_LSugar = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_LSugar IS NULL
#9544

#Column _DIQ175L_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175L_', 'Risk_Hunger', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Hunger = 'YES' WHERE Risk_Hunger = '21'
SELECT COUNT (Risk_Hunger) FROM tschwedhelm.DIQ_I WHERE Risk_Hunger = 'YES'
#59
UPDATE tschwedhelm.DIQ_I SET Risk_Hunger = NULL WHERE Risk_Hunger = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Hunger IS NULL
#9516

#Column _DIQ175M_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175M_', 'Risk_Paresth', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Paresth = 'YES' WHERE Risk_Paresth = '22'
SELECT COUNT (Risk_Paresth) FROM tschwedhelm.DIQ_I WHERE Risk_Paresth = 'YES'
#138
UPDATE tschwedhelm.DIQ_I SET Risk_Paresth = NULL WHERE Risk_Paresth = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Paresth IS NULL
#9437

#Column _DIQ175N_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175N_', 'Risk_Vision', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Vision = 'YES' WHERE Risk_Vision = '23'
SELECT COUNT (Risk_Vision) FROM tschwedhelm.DIQ_I WHERE Risk_Vision = 'YES'
#109
UPDATE tschwedhelm.DIQ_I SET Risk_Vision = NULL WHERE Risk_Vision = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Vision IS NULL
#9466

#Column _DIQ175O_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175O_', 'Risk_Fatigue', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Fatigue = 'YES' WHERE Risk_Fatigue = '24'
SELECT COUNT (Risk_Fatigue) FROM tschwedhelm.DIQ_I WHERE Risk_Fatigue = 'YES'
#134
UPDATE tschwedhelm.DIQ_I SET Risk_Fatigue = NULL WHERE Risk_Fatigue = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Fatigue IS NULL
#9441

#Column _DIQ175P_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175P_', 'Risk_Anyone', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Anyone = 'YES' WHERE Risk_Anyone = '25'
SELECT COUNT (Risk_Anyone) FROM tschwedhelm.DIQ_I WHERE Risk_Anyone = 'YES'
#117
UPDATE tschwedhelm.DIQ_I SET Risk_Anyone = NULL WHERE Risk_Anyone = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Anyone IS NULL
#9458

#Column _DIQ175Q_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175Q_', 'Risk_Warning', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Warning = 'YES' WHERE Risk_Warning = '26'
SELECT COUNT (Risk_Warning) FROM tschwedhelm.DIQ_I WHERE Risk_Warning = 'YES'
#136
UPDATE tschwedhelm.DIQ_I SET Risk_Warning = NULL WHERE Risk_Warning = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Warning IS NULL
#9439

#Column _DIQ175R_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175R_', 'Risk_Other', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Other = 'YES' WHERE Risk_Other = '27'
SELECT COUNT (Risk_Other) FROM tschwedhelm.DIQ_I WHERE Risk_Other = 'YES'
#23
UPDATE tschwedhelm.DIQ_I SET Risk_Other = NULL WHERE Risk_Other = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Other IS NULL
#9552

#Column _DIQ175S_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175S_', 'Risk_GDM', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_GDM = 'YES' WHERE Risk_GDM = '28'
SELECT COUNT (Risk_GDM) FROM tschwedhelm.DIQ_I WHERE Risk_GDM = 'YES'
#31
UPDATE tschwedhelm.DIQ_I SET Risk_GDM = NULL WHERE Risk_GDM = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_GDM IS NULL
#9544

#Column _DIQ175T_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175T_', 'Risk_PUria', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_PUria = 'YES' WHERE Risk_PUria = '29'
SELECT COUNT (Risk_PUria) FROM tschwedhelm.DIQ_I WHERE Risk_PUria = 'YES'
#105
UPDATE tschwedhelm.DIQ_I SET Risk_PUria = NULL WHERE Risk_PUria = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_PUria IS NULL
#9470

#Column _DIQ175U_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175U_', 'Risk_PDipsi', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_PDipsi = 'YES' WHERE Risk_PDipsi = '30'
SELECT COUNT (Risk_PDipsi) FROM tschwedhelm.DIQ_I WHERE Risk_PDipsi = 'YES'
#79
UPDATE tschwedhelm.DIQ_I SET Risk_PDipsi = NULL WHERE Risk_PDipsi = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_PDipsi IS NULL
#9496

#Column _DIQ175V_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175V_', 'Risk_Craving', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Craving = 'YES' WHERE Risk_Craving = '31'
SELECT COUNT (Risk_Craving) FROM tschwedhelm.DIQ_I WHERE Risk_Craving = 'YES'
#11
UPDATE tschwedhelm.DIQ_I SET Risk_Craving = NULL WHERE Risk_Craving = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Craving IS NULL
#9564

#Column _DIQ175W_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175W_', 'Risk_Med', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_Med = 'YES' WHERE Risk_Med = '32'
SELECT COUNT (Risk_Med) FROM tschwedhelm.DIQ_I WHERE Risk_Med = 'YES'
#4
UPDATE tschwedhelm.DIQ_I SET Risk_Med = NULL WHERE Risk_Med = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_Med IS NULL
#9571

#Column _DIQ175X_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ175X_', 'Risk_PCOS', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Risk_PCOS = 'YES' WHERE Risk_PCOS = '33'
SELECT COUNT (Risk_PCOS) FROM tschwedhelm.DIQ_I WHERE Risk_PCOS = 'YES'
#1
UPDATE tschwedhelm.DIQ_I SET Risk_PCOS = NULL WHERE Risk_PCOS = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Risk_PCOS IS NULL
#9574

#Column _DIQ180_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ180_', 'Sugar_Test', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Sugar_Test = 'YES' WHERE Sugar_Test = '1'
SELECT COUNT (Sugar_Test) FROM tschwedhelm.DIQ_I WHERE Sugar_Test = 'YES'
#2836
UPDATE tschwedhelm.DIQ_I SET Sugar_Test = 'NO' WHERE Sugar_Test = '2'
SELECT COUNT (Sugar_Test) FROM tschwedhelm.DIQ_I WHERE Sugar_Test = 'NO'
#3167
UPDATE tschwedhelm.DIQ_I SET Sugar_Test = 'REFUSED' WHERE Sugar_Test = '7'
SELECT COUNT (Sugar_Test) FROM tschwedhelm.DIQ_I WHERE Sugar_Test = 'REFUSED'
#2
UPDATE tschwedhelm.DIQ_I SET Sugar_Test = 'DONT KNOW' WHERE Sugar_Test = '9'
SELECT COUNT (Sugar_Test) FROM tschwedhelm.DIQ_I WHERE Sugar_Test = 'DONT KNOW'
#181
UPDATE tschwedhelm.DIQ_I SET Sugar_Test = NULL WHERE Sugar_Test = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Sugar_Test IS NULL
#3389

#Column _DIQ050_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ050_', 'Insulin', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Insulin = 'YES' WHERE Insulin = '1'
SELECT COUNT (Insulin) FROM tschwedhelm.DIQ_I WHERE Insulin = 'YES'
#256
UPDATE tschwedhelm.DIQ_I SET Insulin = 'NO' WHERE Insulin = '2'
SELECT COUNT (Insulin) FROM tschwedhelm.DIQ_I WHERE Insulin = 'NO'
#9316
UPDATE tschwedhelm.DIQ_I SET Insulin = 'REFUSED' WHERE Insulin = '7'
SELECT COUNT (Insulin) FROM tschwedhelm.DIQ_I WHERE Insulin = 'REFUSED'
#1
UPDATE tschwedhelm.DIQ_I SET Insulin = 'DONT KNOW' WHERE Insulin = '9'
SELECT COUNT (Insulin) FROM tschwedhelm.DIQ_I WHERE Insulin = 'DONT KNOW'
#2
UPDATE tschwedhelm.DIQ_I SET Insulin = NULL WHERE Insulin = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Insulin IS NULL
#0

#Column _DID060_ and _DIQ060U_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID060_', 'Insulin_Dur', 'COLUMN'
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ060U_', 'Insulin_Meas', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Ins_Dur_Other nvarchar(50) null
ALTER TABLE tschwedhelm.DIQ_I ADD Ins_Dur_Yrs int null
ALTER TABLE tschwedhelm.DIQ_I ADD Ins_Dur_Mos int null
UPDATE tschwedhelm.DIQ_I SET Ins_Dur_Mos = Insulin_Dur WHERE Insulin_Meas = '1'
UPDATE tschwedhelm.DIQ_I SET Ins_Dur_Mos = 1 WHERE Insulin_Dur = '666'
UPDATE tschwedhelm.DIQ_I SET Ins_Dur_Yrs = Insulin_Dur WHERE Insulin_Meas = '2'
UPDATE tschwedhelm.DIQ_I SET Ins_Dur_Other = 'REFUSED' WHERE Insulin_Dur = '777'
UPDATE tschwedhelm.DIQ_I SET Ins_Dur_Other = 'DONT KNOW' WHERE Insulin_Dur = '999'
UPDATE tschwedhelm.DIQ_I SET Ins_Dur_Other = NULL WHERE Insulin_Dur = 'NA'
SELECT COUNT (Ins_Dur_Yrs) FROM tschwedhelm.DIQ_I
#219
SELECT COUNT (Ins_Dur_Mos) FROM tschwedhelm.DIQ_I
#35
SELECT COUNT (Ins_Dur_Other) FROM tschwedhelm.DIQ_I WHERE Ins_Dur_Other = 'REFUSED'
#0
SELECT COUNT (Ins_Dur_Other) FROM tschwedhelm.DIQ_I WHERE Ins_Dur_Other = 'DONT KNOW'
#2
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN Insulin_Dur
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN Insulin_Meas

#Column _DIQ070_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ070_', 'DM_Pills', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET DM_Pills = 'YES' WHERE DM_Pills = '1'
SELECT COUNT (DM_Pills) FROM tschwedhelm.DIQ_I WHERE DM_Pills = 'YES'
#643
UPDATE tschwedhelm.DIQ_I SET DM_Pills = 'NO' WHERE DM_Pills = '2'
SELECT COUNT (DM_Pills) FROM tschwedhelm.DIQ_I WHERE DM_Pills = 'NO'
#870
UPDATE tschwedhelm.DIQ_I SET DM_Pills = 'REFUSED' WHERE DM_Pills = '7'
SELECT COUNT (DM_Pills) FROM tschwedhelm.DIQ_I WHERE DM_Pills = 'REFUSED'
#1
UPDATE tschwedhelm.DIQ_I SET DM_Pills = 'DONT KNOW' WHERE DM_Pills = '9'
SELECT COUNT (DM_Pills) FROM tschwedhelm.DIQ_I WHERE DM_Pills = 'DONT KNOW'
#1
UPDATE tschwedhelm.DIQ_I SET DM_Pills = NULL WHERE DM_Pills = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE DM_Pills IS NULL
#8060

#Column _DIQ230_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ230_', 'DM_dr', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET DM_dr = '<1 yr' WHERE DM_dr = '1'
SELECT COUNT (DM_dr) FROM tschwedhelm.DIQ_I WHERE DM_dr = '<1 yr'
#276
UPDATE tschwedhelm.DIQ_I SET DM_dr = '1-2 yrs' WHERE DM_dr = '2'
SELECT COUNT (DM_dr) FROM tschwedhelm.DIQ_I WHERE DM_dr = '1-2 yrs'
#64
UPDATE tschwedhelm.DIQ_I SET DM_dr = '2-5 yrs' WHERE DM_dr = '3'
SELECT COUNT (DM_dr) FROM tschwedhelm.DIQ_I WHERE DM_dr = '2-5 yrs'
#86
UPDATE tschwedhelm.DIQ_I SET DM_dr = '>5 yrs' WHERE DM_dr = '4'
SELECT COUNT (DM_dr) FROM tschwedhelm.DIQ_I WHERE DM_dr = '>5 yrs'
#85
UPDATE tschwedhelm.DIQ_I SET DM_dr = 'NEVER' WHERE DM_dr = '5'
SELECT COUNT (DM_dr) FROM tschwedhelm.DIQ_I WHERE DM_dr = 'NEVER'
#330
UPDATE tschwedhelm.DIQ_I SET DM_dr = 'REFUSED' WHERE DM_dr = '7'
SELECT COUNT (DM_dr) FROM tschwedhelm.DIQ_I WHERE DM_dr = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET DM_dr = 'DONT KNOW' WHERE DM_dr = '9'
SELECT COUNT (DM_dr) FROM tschwedhelm.DIQ_I WHERE DM_dr = 'DONT KNOW'
#12
UPDATE tschwedhelm.DIQ_I SET DM_dr = NULL WHERE DM_dr = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE DM_dr IS NULL
#8722

#Column _DIQ240_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ240_', 'One_DM_dr', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET One_DM_dr = 'YES' WHERE One_DM_dr = '1'
SELECT COUNT (One_DM_dr) FROM tschwedhelm.DIQ_I WHERE One_DM_dr = 'YES'
#643
UPDATE tschwedhelm.DIQ_I SET One_DM_dr = 'NO' WHERE One_DM_dr = '2'
SELECT COUNT (One_DM_dr) FROM tschwedhelm.DIQ_I WHERE One_DM_dr = 'NO'
#210
UPDATE tschwedhelm.DIQ_I SET One_DM_dr = 'REFUSED' WHERE One_DM_dr = '7'
SELECT COUNT (One_DM_dr) FROM tschwedhelm.DIQ_I WHERE One_DM_dr = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET One_DM_dr = 'DONT KNOW' WHERE One_DM_dr = '9'
SELECT COUNT (One_DM_dr) FROM tschwedhelm.DIQ_I WHERE One_DM_dr = 'DONT KNOW'
#0
UPDATE tschwedhelm.DIQ_I SET One_DM_dr = NULL WHERE One_DM_dr = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE One_DM_dr IS NULL
#8722

#Column _DID250_
SELECT DISTINCT (_DID250_) FROM tschwedhelm.DIQ_I
EXEC sp_rename 'tschwedhelm.DIQ_I._DID250_', 'Visits', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Annual_Visits_Other nvarchar(50) null
ALTER TABLE tschwedhelm.DIQ_I ADD Annual_Visits int null
UPDATE tschwedhelm.DIQ_I SET Annual_Visits_Other = 'REFUSED' WHERE Visits = '7777'
SELECT COUNT (Annual_Visits_Other) FROM tschwedhelm.DIQ_I WHERE Annual_Visits_Other = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET Annual_Visits_Other = 'DONT KNOW' WHERE Visits = '9999'
SELECT COUNT (Annual_Visits_Other) FROM tschwedhelm.DIQ_I WHERE Annual_Visits_Other = 'DONT KNOW'
#3
UPDATE tschwedhelm.DIQ_I SET Annual_Visits = Visits WHERE Visits <100 AND Visits != 'NA'
SELECT COUNT (Annual_Visits) FROM tschwedhelm.DIQ_I
#640
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN Visits

#Column _DID260_ and _DIQ260U_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID260_', 'FSG', 'COLUMN'
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ260U_', 'FSG_Meas', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD FSG_Other nvarchar(50) null
ALTER TABLE tschwedhelm.DIQ_I ADD FSG_Day int null
ALTER TABLE tschwedhelm.DIQ_I ADD FSG_Week int null
ALTER TABLE tschwedhelm.DIQ_I ADD FSG_Month int null
ALTER TABLE tschwedhelm.DIQ_I ADD FSG_Year int null
UPDATE tschwedhelm.DIQ_I SET FSG_Day = FSG WHERE FSG_Meas = '1'
SELECT COUNT (FSG_Day) FROM tschwedhelm.DIQ_I
#412
UPDATE tschwedhelm.DIQ_I SET FSG_Week = FSG WHERE FSG_Meas = '2'
SELECT COUNT (FSG_Week) FROM tschwedhelm.DIQ_I
#150
UPDATE tschwedhelm.DIQ_I SET FSG_Month = FSG WHERE FSG_Meas = '3'
SELECT COUNT (FSG_Month) FROM tschwedhelm.DIQ_I
#65
UPDATE tschwedhelm.DIQ_I SET FSG_Year = FSG WHERE FSG_Meas = '4'
SELECT COUNT (FSG_Year) FROM tschwedhelm.DIQ_I
#34
UPDATE tschwedhelm.DIQ_I SET FSG_Other = 'NEVER' WHERE FSG = '0'
SELECT COUNT (FSG_Other) FROM tschwedhelm.DIQ_I WHERE FSG_Other = 'NEVER'
#188
UPDATE tschwedhelm.DIQ_I SET FSG_Other = 'REFUSED' WHERE FSG = '7777'
SELECT COUNT (FSG_Other) FROM tschwedhelm.DIQ_I WHERE FSG_Other = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET FSG_Other = 'DONT KNOW' WHERE FSG = '9999'
SELECT COUNT (FSG_Other) FROM tschwedhelm.DIQ_I WHERE FSG = 'DONT KNOW'
#0
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN FSG
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN FSG_Meas

#Column _DIQ275_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ275_', 'A1C', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET A1C = 'YES' WHERE A1C = '1'
SELECT COUNT (A1C) FROM tschwedhelm.DIQ_I WHERE A1C = 'YES'
#641
UPDATE tschwedhelm.DIQ_I SET A1C = 'NO' WHERE A1C = '2'
SELECT COUNT (A1C) FROM tschwedhelm.DIQ_I WHERE A1C = 'NO'
#156
UPDATE tschwedhelm.DIQ_I SET A1C = 'REFUSED' WHERE A1C = '7'
SELECT COUNT (A1C) FROM tschwedhelm.DIQ_I WHERE A1C = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET A1C = 'DONT KNOW' WHERE A1C = '9'
SELECT COUNT (A1C) FROM tschwedhelm.DIQ_I WHERE A1C = 'DONT KNOW'
#56
UPDATE tschwedhelm.DIQ_I SET A1C = NULL WHERE A1C = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE A1C IS NULL
#8722

#Column _DIQ280_
SELECT DISTINCT _DIQ280_ FROM tschwedhelm.DIQ_I ORDER BY _DIQ280_ DESC
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ280_', 'Meas_A1C', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Last_A1C_Other nvarchar(50) null
ALTER TABLE tschwedhelm.DIQ_I ADD Last_A1C nvarchar(50) null
UPDATE tschwedhelm.DIQ_I SET Last_A1C = Meas_A1C WHERE Meas_A1C != '777' AND Meas_A1C != '999' AND Meas_A1C != 'NA'
SELECT COUNT (Last_A1C) FROM tschwedhelm.DIQ_I
#404
ALTER TABLE tschwedhelm.DIQ_I ALTER COLUMN Last_A1C numeric null
SELECT AVG (Last_A1C) FROM tschwedhelm.DIQ_I
#7.38
UPDATE tschwedhelm.DIQ_I SET Last_A1C_Other = 'REFUSED' WHERE Meas_A1C = '777'
SELECT COUNT (Last_A1C_Other) FROM tschwedhelm.DIQ_I WHERE Last_A1C_Other = 'REFUSED'
#2
UPDATE tschwedhelm.DIQ_I SET Last_A1C_Other = 'DONT KNOW' WHERE Meas_A1C = '999'
SELECT COUNT (Last_A1C_Other) FROM tschwedhelm.DIQ_I WHERE Last_A1C_Other = 'DONT KNOW'
#235
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN Meas_A1C

#Column _DIQ291_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ291_', 'Goal_A1C', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = '<6' WHERE Goal_A1C = '1'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = '<6'
#213
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = '<7' WHERE Goal_A1C = '2'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = '<7'
#182
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = '<8' WHERE Goal_A1C = '3'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = '<8'
#32
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = '<9' WHERE Goal_A1C = '4'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = '<9'
#5
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = '<10' WHERE Goal_A1C = '5'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = '<10'
#9
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = 'NO GOAL' WHERE Goal_A1C = '6'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = 'NO GOAL'
#88
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = 'REFUSED' WHERE Goal_A1C = '77'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = 'REFUSED'
#2
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = 'DONT KNOW' WHERE Goal_A1C = '99'
SELECT COUNT (Goal_A1C) FROM tschwedhelm.DIQ_I WHERE Goal_A1C = 'DONT KNOW'
#110
UPDATE tschwedhelm.DIQ_I SET Goal_A1C = NULL WHERE Goal_A1C = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Goal_A1C IS NULL
#8934

#Column _DIQ300S_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ300S_', 'L_SBP', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Last_SBP int null
ALTER TABLE tschwedhelm.DIQ_I ADD Last_SBP_Other nvarchar(50) null
UPDATE tschwedhelm.DIQ_I SET Last_SBP_Other = 'REFUSED' WHERE L_SBP = '7777'
SELECT COUNT (Last_SBP_Other) FROM tschwedhelm.DIQ_I WHERE Last_SBP_Other = 'REFUSED'
#1
UPDATE tschwedhelm.DIQ_I SET Last_SBP_Other = 'DONT KNOW' WHERE L_SBP = '9999'
SELECT COUNT (Last_SBP_Other) FROM tschwedhelm.DIQ_I WHERE Last_SBP_Other = 'DONT KNOW'
#305
UPDATE tschwedhelm.DIQ_I SET Last_SBP = L_SBP WHERE L_SBP != '7777' AND L_SBP != '9999' AND L_SBP != 'NA'
SELECT COUNT (Last_SBP) FROM tschwedhelm.DIQ_I
#539
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN L_SBP

#Column _DIQ300D_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ300D_', 'L_DBP', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Last_DBP int null
ALTER TABLE tschwedhelm.DIQ_I ADD Last_DBP_Other nvarchar(50) null
UPDATE tschwedhelm.DIQ_I SET Last_DBP_Other = 'REFUSED' WHERE L_DBP = '7777'
SELECT COUNT (Last_DBP_Other) FROM tschwedhelm.DIQ_I WHERE Last_DBP_Other = 'REFUSED'
#2
UPDATE tschwedhelm.DIQ_I SET Last_DBP_Other = 'DONT KNOW' WHERE L_DBP = '9999'
SELECT COUNT (Last_DBP_Other) FROM tschwedhelm.DIQ_I WHERE Last_DBP_Other = 'DONT KNOW'
#328
UPDATE tschwedhelm.DIQ_I SET Last_DBP = L_DBP WHERE L_DBP != '7777' AND L_DBP != '9999' AND L_DBP != 'NA'
SELECT COUNT (Last_DBP) FROM tschwedhelm.DIQ_I
#515
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN L_DBP

#Column _DID310S_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID310S_', 'Goal_SBP', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Goal_SBP = 'NO GOAL' WHERE Goal_SBP = '6666'
SELECT COUNT (Goal_SBP) FROM tschwedhelm.DIQ_I WHERE Goal_SBP = 'NO GOAL'
#308
UPDATE tschwedhelm.DIQ_I SET Goal_SBP = 'REFUSED' WHERE Goal_SBP = '7777'
SELECT COUNT (Goal_SBP) FROM tschwedhelm.DIQ_I WHERE Goal_SBP = 'REFUSED'
#2
UPDATE tschwedhelm.DIQ_I SET Goal_SBP = 'DONT KNOW' WHERE Goal_SBP = '9999'
SELECT COUNT (Goal_SBP) FROM tschwedhelm.DIQ_I WHERE Goal_SBP = 'DONT KNOW'
#200
UPDATE tschwedhelm.DIQ_I SET Goal_SBP = NULL WHERE Goal_SBP = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Goal_SBP IS NULL
#8729
SELECT COUNT (Goal_SBP) FROM tschwedhelm.DIQ_I WHERE Goal_SBP != 'NO GOAL' AND Goal_SBP != 'REFUSED' AND Goal_SBP != 'DONT KNOW' AND Goal_SBP != 'NA'
#336

#Column _DID310D_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID310D_', 'Goal_DBP', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Goal_DBP = 'NO GOAL' WHERE Goal_DBP = '6666'
SELECT COUNT (Goal_DBP) FROM tschwedhelm.DIQ_I WHERE Goal_DBP = 'NO GOAL'
#308
UPDATE tschwedhelm.DIQ_I SET Goal_DBP = 'REFUSED' WHERE Goal_DBP = '7777'
SELECT COUNT (Goal_DBP) FROM tschwedhelm.DIQ_I WHERE Goal_DBP = 'REFUSED'
#2
UPDATE tschwedhelm.DIQ_I SET Goal_DBP = 'DONT KNOW' WHERE Goal_DBP = '9999'
SELECT COUNT (Goal_DBP) FROM tschwedhelm.DIQ_I WHERE Goal_DBP = 'DONT KNOW'
#221
UPDATE tschwedhelm.DIQ_I SET Goal_DBP = NULL WHERE Goal_DBP = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Goal_DBP IS NULL
#8729
SELECT COUNT (Goal_DBP) FROM tschwedhelm.DIQ_I WHERE Goal_DBP != 'NO GOAL' AND Goal_DBP != 'REFUSED' AND Goal_DBP != 'DONT KNOW' AND Goal_DBP != 'NA'
#315

#Column _DID320_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID320_', 'L_LDL', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Last_LDL int null
ALTER TABLE tschwedhelm.DIQ_I ADD Last_LDL_Other nvarchar(50) null
UPDATE tschwedhelm.DIQ_I SET Last_LDL_Other = 'NEVER HEARD OF LDL' WHERE L_LDL = '5555'
SELECT COUNT (Last_LDL_Other) FROM tschwedhelm.DIQ_I WHERE Last_LDL_Other = 'NEVER HEARD OF LDL'
#59
UPDATE tschwedhelm.DIQ_I SET Last_LDL_Other = 'NEVER TESTED' WHERE L_LDL = '6666'
SELECT COUNT (Last_LDL_Other) FROM tschwedhelm.DIQ_I WHERE Last_LDL_Other = 'NEVER TESTED'
#34
UPDATE tschwedhelm.DIQ_I SET Last_LDL_Other = 'REFUSED' WHERE L_LDL = '7777'
SELECT COUNT (Last_LDL_Other) FROM tschwedhelm.DIQ_I WHERE Last_LDL_Other = 'REFUSED'
#5
UPDATE tschwedhelm.DIQ_I SET Last_LDL_Other = 'DONT KNOW' WHERE L_LDL = '9999'
SELECT COUNT (Last_LDL_Other) FROM tschwedhelm.DIQ_I WHERE Last_LDL_Other = 'DONT KNOW'
#633
UPDATE tschwedhelm.DIQ_I SET Last_LDL = L_LDL WHERE L_LDL != '5555' AND L_LDL != '6666' AND L_LDL != '7777' AND L_LDL != '9999' AND L_LDL != 'NA'
SELECT COUNT (Last_LDL) FROM tschwedhelm.DIQ_I
#115
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN L_LDL

#Column _DID330_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID330_', 'Goal_LDL', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Goal_LDL = 'NO GOAL' WHERE Goal_LDL = '6666'
SELECT COUNT (Goal_LDL) FROM tschwedhelm.DIQ_I WHERE Goal_LDL = 'NO GOAL'
#242
UPDATE tschwedhelm.DIQ_I SET Goal_LDL = 'REFUSED' WHERE Goal_LDL = '7777'
SELECT COUNT (Goal_LDL) FROM tschwedhelm.DIQ_I WHERE Goal_LDL = 'REFUSED'
#3
UPDATE tschwedhelm.DIQ_I SET Goal_LDL = 'DONT KNOW' WHERE Goal_LDL = '9999'
SELECT COUNT (Goal_LDL) FROM tschwedhelm.DIQ_I WHERE Goal_LDL = 'DONT KNOW'
#421
UPDATE tschwedhelm.DIQ_I SET Goal_LDL = NULL WHERE Goal_LDL = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Goal_LDL IS NULL
#8822
SELECT COUNT (Goal_LDL) FROM tschwedhelm.DIQ_I WHERE Goal_LDL != 'NO GOAL' AND Goal_LDL != 'REFUSED' AND Goal_LDL != 'DONT KNOW'
#87 with values

#Column _DID341_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID341_', 'FCheck', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Foot_Check int null
ALTER TABLE tschwedhelm.DIQ_I ADD Foot_Check_Other nvarchar(50) null
UPDATE tschwedhelm.DIQ_I SET Foot_Check_Other = 'REFUSED' WHERE FCheck = '7777'
SELECT COUNT (Foot_Check_Other) FROM tschwedhelm.DIQ_I WHERE Foot_Check_Other = 'REFUSED'
#2
UPDATE tschwedhelm.DIQ_I SET Foot_Check_Other = 'DONT KNOW' WHERE FCheck = '9999'
SELECT COUNT (Foot_Check_Other) FROM tschwedhelm.DIQ_I WHERE Foot_Check_Other = 'DONT KNOW'
#9
UPDATE tschwedhelm.DIQ_I SET Foot_Check = FCheck WHERE FCheck != '7777' AND FCheck != '9999' AND FCheck != 'NA'
SELECT COUNT (Foot_Check) FROM tschwedhelm.DIQ_I
#832 after combining no foot checks and numbered foot checks
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN FCheck

#Column _DID350_ and _DIQ350U_
EXEC sp_rename 'tschwedhelm.DIQ_I._DID350_', 'SF', 'COLUMN'
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ350U_', 'SF_Meas', 'COLUMN'
ALTER TABLE tschwedhelm.DIQ_I ADD Self_Foot_Other nvarchar(50) null
ALTER TABLE tschwedhelm.DIQ_I ADD Self_Foot_Day int null
ALTER TABLE tschwedhelm.DIQ_I ADD Self_Foot_Week int null
ALTER TABLE tschwedhelm.DIQ_I ADD Self_Foot_Month int null
ALTER TABLE tschwedhelm.DIQ_I ADD Self_Foot_Year int null
UPDATE tschwedhelm.DIQ_I SET Self_Foot_Day = SF WHERE SF_Meas = '1'
SELECT COUNT (Self_Foot_Day) FROM tschwedhelm.DIQ_I
#487
UPDATE tschwedhelm.DIQ_I SET Self_Foot_Week = SF WHERE SF_Meas = '2'
SELECT COUNT (Self_Foot_Week) FROM tschwedhelm.DIQ_I
#152
UPDATE tschwedhelm.DIQ_I SET Self_Foot_Month = SF WHERE SF_Meas = '3'
SELECT COUNT (Self_Foot_Month) FROM tschwedhelm.DIQ_I
#46
UPDATE tschwedhelm.DIQ_I SET Self_Foot_Year = SF WHERE SF_Meas = '4'
SELECT COUNT (Self_Foot_Year) FROM tschwedhelm.DIQ_I
#14
UPDATE tschwedhelm.DIQ_I SET Self_Foot_Other = 'NONE' WHERE SF = '0'
SELECT COUNT (Self_Foot_Other) FROM tschwedhelm.DIQ_I WHERE Self_Foot_Other = 'NONE'
#139
UPDATE tschwedhelm.DIQ_I SET Self_Foot_Other = 'REFUSED' WHERE SF = '7777'
SELECT COUNT (Self_Foot_Other) FROM tschwedhelm.DIQ_I WHERE Self_Foot_Other = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET Self_Foot_Other = 'DONT KNOW' WHERE SF = '9999'
SELECT COUNT (Self_Foot_Other) FROM tschwedhelm.DIQ_I WHERE Self_Foot_Other = 'DONT KNOW'
#5
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN SF
ALTER TABLE tschwedhelm.DIQ_I DROP COLUMN SF_Meas

#Column _DIQ360_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ360_', 'Pupils', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Pupils = '<1 mo' WHERE Pupils = '1'
SELECT COUNT (Pupils) FROM tschwedhelm.DIQ_I WHERE Pupils = '<1 mo'
#82
UPDATE tschwedhelm.DIQ_I SET Pupils = '1-12 mos' WHERE Pupils = '2'
SELECT COUNT (Pupils) FROM tschwedhelm.DIQ_I WHERE Pupils = '1-12 mos'
#440
UPDATE tschwedhelm.DIQ_I SET Pupils = '13-24 mos' WHERE Pupils = '3'
SELECT COUNT (Pupils) FROM tschwedhelm.DIQ_I WHERE Pupils = '13-24 mos'
#129
UPDATE tschwedhelm.DIQ_I SET Pupils = '>2 yrs' WHERE Pupils = '4'
SELECT COUNT (Pupils) FROM tschwedhelm.DIQ_I WHERE Pupils = '>2 yrs'
#116
UPDATE tschwedhelm.DIQ_I SET Pupils = 'NEVER' WHERE Pupils = '5'
SELECT COUNT (Pupils) FROM tschwedhelm.DIQ_I WHERE Pupils = 'NEVER'
#64
UPDATE tschwedhelm.DIQ_I SET Pupils = 'REFUSED' WHERE Pupils = '7'
SELECT COUNT (Pupils) FROM tschwedhelm.DIQ_I WHERE Pupils = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET Pupils = 'DONT KNOW' WHERE Pupils = '9'
SELECT COUNT (Pupils) FROM tschwedhelm.DIQ_I WHERE Pupils = 'DONT KNOW'
#15
UPDATE tschwedhelm.DIQ_I SET Pupils = NULL WHERE Pupils = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Pupils IS NULL
#8729

#Column _DIQ080_
EXEC sp_rename 'tschwedhelm.DIQ_I._DIQ080_', 'Retinopathy', 'COLUMN'
UPDATE tschwedhelm.DIQ_I SET Retinopathy = 'YES' WHERE Retinopathy = '1'
SELECT COUNT (Retinopathy) FROM tschwedhelm.DIQ_I WHERE Retinopathy = 'YES'
#194
UPDATE tschwedhelm.DIQ_I SET Retinopathy = 'NO' WHERE Retinopathy = '2'
SELECT COUNT (Retinopathy) FROM tschwedhelm.DIQ_I WHERE Retinopathy = 'NO'
#644
UPDATE tschwedhelm.DIQ_I SET Retinopathy = 'REFUSED' WHERE Retinopathy = '7'
SELECT COUNT (Retinopathy) FROM tschwedhelm.DIQ_I WHERE Retinopathy = 'REFUSED'
#0
UPDATE tschwedhelm.DIQ_I SET Retinopathy = 'DONT KNOW' WHERE Retinopathy = '9'
SELECT COUNT (Retinopathy) FROM tschwedhelm.DIQ_I WHERE Retinopathy = 'DONT KNOW'
#8
UPDATE tschwedhelm.DIQ_I SET Retinopathy = NULL WHERE Retinopathy = 'NA'
SELECT COUNT (*) FROM tschwedhelm.DIQ_I WHERE Retinopathy IS NULL
#8729
