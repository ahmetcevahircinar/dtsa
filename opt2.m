function [eniyideger,eniyiyol] = opt2(data,yol)
D = size(data,1);
eniyiyol=yol;
eniyideger = obj(D,eniyiyol,data);
kombinasyonlar=combnk(1:D,2);
i=0;
say=1;
while i<size(kombinasyonlar,1)    
    i=i+1;
    geciciyol=eniyiyol(1:D);
    geciciyol(kombinasyonlar(i,1):kombinasyonlar(i,2))=fliplr(geciciyol(kombinasyonlar(i,1):kombinasyonlar(i,2)));
    geciciyol=[geciciyol geciciyol(1)];
    geciciyoldeger=obj(D,geciciyol,data);
    say=say+1;
    if geciciyoldeger<eniyideger
        eniyiyol=geciciyol;
        eniyideger=geciciyoldeger;
    end
end
say
end