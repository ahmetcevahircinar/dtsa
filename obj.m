function [ toplamuzaklik ] = obj(D,birey,data)
toplamuzaklik=0;
for i=1:D
    uzaklik=data(birey(i),birey(i+1));
    toplamuzaklik=toplamuzaklik+uzaklik;
end
end

