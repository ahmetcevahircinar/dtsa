function [sonuclar] = dosyaoku()

load('tspdata/kroE100.mat')
[D]=size(data,1);
N=D;
ST=0.1;
maxFEs=D*900;
iterdosyaadi=strcat('kroE100_',num2str(ST*10),'_N',num2str(N),'_D',num2str(D),'_',num2str(maxFEs),'_iters');
dosyaadi=strcat('kroE100_',num2str(ST*10),'_N',num2str(N),'_D',num2str(D),'_',num2str(maxFEs));
load(iterdosyaadi)
load(dosyaadi)
ortsure=mean(dosya(1:30,4));
baslangic=mean(dosya(1:30,1));
tsamean=mean(dosya(1:30,2));
ort=mean(dosya(1:30,3));
eniyi=min(dosya(1:30,3));
enkotu=max(dosya(1:30,3));
sapma=std(dosya(1:30,3));
medyan=median(dosya(1:30,3));
sonuclar=[ortsure baslangic tsamean ort eniyi enkotu sapma medyan];
end
