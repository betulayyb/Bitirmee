function [egitim, egitimc, test, testc] = orneklem(data)
ornekyuzde = 50 ;
% Veri setinden �rneklem olu�turma program�

% S�STEMAT�K �RNEKLEME
 
% Toplum hacminin 1000 dolaylar�nda oldu�u ve
% birimlere 1�den N�e kadar s�ra numaras� verilebildi�i
% durumlarda uygulan�r . 
% n �rnek; 
% 1) Devir say�s� (d) ; d <= N/n
% 2) Ba�lang�� say�s� (a); 1<= a <= d belirlenir .
% 3) �rnek no�lar� a, a+d, a+2d, ..., a+(n-1)d �eklinde
% belirlenir .

% Not: �rneklem olu�turulurken sat�r say�lar� aras�nda �rnek se�ilir. S�tunlar dikkate al�nmaz.
% Not: Genel veri setinin �ncelikle se�ilecek �zelli�ie g�re s�ralanmas� gerekmektedir.
% S�ralama i�in  B = sortrows(A,3) komutu kullan�labilir. A s�ralanacak
% matris, 3 ise referans olarak s�ralanacak matrisi ifade eder.

N =  size(data,1);
% ornekyuzde = 25 ;
n = floor(N*ornekyuzde/100) ;

% n = orneklem, N adet �rnekten se�ilecek y�zdelik miktar� miktar�n� temsil eder.

% Devir say�s�n�n hesaplanmas�
d = round(N/n) ; 

% Ba�lang�� say�s� (a)
a = 1 ;
s = size(data,2) ;
% �rneklenmi� matris olu�turma (OM) Test verisi olarak kullan�lacakt�r.
% Test Veri seti
for i=1:n
    B=(a+d*(i-1));
    if (B>N)
        C=B-N;
    else
        C=B;
    end
	test1(i,:) = data(C,:) ;
end

test = test1(:,1:s-1) ;

testc = test1(:,s) ;

% E�itim Veri seti

egitim1 = data ;
for i=1:n
	silme(i) = (a+d*(i-1)) ;
end    
    
silme=sort(silme,'descend');

for i=1:n
    k = silme(i) ;
    egitim1(k,:) = [] ;
end    

egitim = egitim1(:,1:s-1) ;

egitimc = egitim1(:,s) ;

end