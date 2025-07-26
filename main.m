for p=1:1
%     P={'rd400', 'fl417', 'pr439','pcb442', 'd493', 'u574', 'rat575', 'p654', 'd657', 'u724' ,'rat783'};
    P={'oliver30'};
    s=strcat('tspdata/',P(p),'.mat');
    load(s{1});
    maxrun=10;
    [D]=size(data,1);
    for f=1:1
        fesler=[1000000 5000000 10000000 20000000];
        maxFEs=fesler(f);
        for s=1:1
            seteler=[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
            ST=seteler(s);
            poplar=[100 200 500];
            for pp=1:1
                N=poplar(pp);
                [bestParams]=TSPTSA(P(p),maxrun,maxFEs,N,D,ST,data);
            end
        end
    end
end