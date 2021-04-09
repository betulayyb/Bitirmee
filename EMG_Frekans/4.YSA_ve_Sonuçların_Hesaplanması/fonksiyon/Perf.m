function [Per_Par]=Perf(egitimc, egitims)
% Performans parametrelerinin hesaplanmas�
% Verilerin y�klenmesi
% close all ; clear all ; clc ;
% load Performans
%%
% gercek_sonuclar = egitimc ;
% simulasyon_sonuclari = egitims ;
% crosstab komutu ile sonu�lar�n �apraz tabloya aktar�lmas�
% Ger�ek sonu�lar tablosunun solunda, simulasyon sonu�lar� ise tablo
% �st�nde olmal�d�r.
capraz_tablo = crosstab(egitimc, egitims) ;
if size(capraz_tablo,2)==1
    capraz_tablo(2,2)=0;
    capraz_tablo(2,1)=0;
end
% Tablonun sa� taraf�ndaki toplamlar�n yaz�d�rlmas�
capraz_tablo(1,3) = capraz_tablo(1,1) + capraz_tablo(1,2) ;
capraz_tablo(2,3) = capraz_tablo(2,1) + capraz_tablo(2,2) ;
% Tablonun alt taraf�ndaki toplamlar�n yaz�d�rlmas�
capraz_tablo(3,1) = capraz_tablo(1,1) + capraz_tablo(2,1) ;
capraz_tablo(3,2) = capraz_tablo(1,2) + capraz_tablo(2,2) ;
capraz_tablo(3,3) = capraz_tablo(3,1) + capraz_tablo(3,2) ;

%% Apne i�in S�n�f do�ruluk oran�, Sensivity ve specificity de�erlerinin hesaplanmas�
TP = capraz_tablo(1,1) ;
FN = capraz_tablo(1,2) ;
TN = capraz_tablo(2,2) ;
FP = capraz_tablo(2,1) ;
% Do�ruluk Oran�
Acc = (TP+TN)/(TP+TN+FP+FN)*100 ;
% Sensivity
Sen = TP / (TP+FN) ;
% Specificity
Spe = TN / (TN+FP) ;
% F-�l��m�
F_O = (2 * Sen * Spe) / (Sen + Spe) ;
% Kappa
Kappa = cohenskappa(egitimc, egitims) ;
% AUC De�erinin Hesaplanmas�
[AUC] = AUC_hesaplama(egitimc, egitims) ;
% De�erlerin birle�tirilmesi
Per_Par=[Acc Sen Spe F_O Kappa AUC];
end