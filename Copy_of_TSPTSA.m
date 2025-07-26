function [bestParams,enler]=TSPTSA(maxrun,maxFEs,N,D,data)
iterdosyaadi=strcat('M1_9X_N',num2str(N),'_D',num2str(D),'_',num2str(maxFEs),'_iters');
dosyaadi=strcat('M1_9X_N',num2str(N),'_D',num2str(D),'_',num2str(maxFEs));

low=ceil(N*0.1);
high=ceil(N*0.25);

dosya=zeros(maxrun+1,D+2);
iterasyonlar=[];

[enkisaobj,enkisa] = enen(data);

for run=1:maxrun
    rng('shuffle');
    tic;
    
    trees=zeros(N,D+1);
    obj_trees=zeros(1,N);
    for i=1:N
        trees(i,1:D)=randperm(D);
        trees(i,D+1)=trees(i,1);
        trees(i,:)=enkisa;
        obj_trees(i)=obj(D,trees(i,:),data);
    end
    FEs = N;
    
    [minimum,min_indis]=min(obj_trees);
    bestParams=trees(min_indis,:);
    
    [maks,maks_indis]=max(obj_trees);
    trees(maks_indis,:)=enkisa;
    obj_trees(maks_indis)=obj(D,trees(maks_indis,:),data);
    
    iter=0;
    enler=[];
    
    while(FEs<=maxFEs)
        iter=iter+1;
        for i=1:N
            ns=fix(low+(high-low)*rand)+1;
            
            seeds=zeros(ns,D+1);
            obj_seeds=zeros(1,ns);
            
            if(ns>high)
                ns=high;
            end;
            for j=1:ns
                seeds(j,:)=trees(i,:);
                k=randi(N);
                while i==k
                    k=randi(N);
                end                
                n=randi(9);
                %                 nnn=[5 6 7 8 9 10 11 12 13];
%                                 nnn=[7 8 9];
%                                 nn=randi(3);
%                                 n=nnn(nn);
%                 n=9;
                enler=[enler n];
                switch n
                    case 1
                        [o1] = op_swap(trees(i,1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];
                    case 2
                        [o1] = op_swap(trees(k,1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];                        
                    case 3
                        [o1] = op_swap(bestParams(1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];                        
                    case 4
                        [o1] = op_shift(trees(i,1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];
                    case 5
                        [o1] = op_shift(trees(k,1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];                        
                    case 6
                        [o1] = op_shift(bestParams(1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];                        
                    case 7
                        [o1] = op_symmetry(trees(i,1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];                        
                    case 8
                        [o1] = op_symmetry(trees(k,1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];                        
                    case 9
                        [o1] = op_symmetry(bestParams(1:D),D);
                        [seeds(j,:)]=[o1 o1(1)];                        
                end
                
%                 dizilim=1:D;
%                 if dizilim==unique(seeds(j,1:D))
%                 else
%                     fprintf('Olmaz\n');
%                 end
%                 
%                 if seeds(j,1)~=seeds(j,D+1)
%                     fprintf('Olmaz\n');
%                     seeds(j,:)
%                     fprintf('Dur\n');
%                 end
                obj_seeds(j)=obj(D,seeds(j,:),data);
                
            end
            
            [mintohum,mintohum_indis]=min(obj_seeds);
            if(mintohum<obj_trees(i))
                trees(i,:)=seeds(mintohum_indis,:);
                obj_trees(i)=mintohum;
            end;
            FEs = FEs + ns;
        end
                
                if mod(iter,10)==0
                    [~,max_tree_index]=max(obj_trees);
                    [kk] = randperm(D);
                    trees(max_tree_index,:)=[kk kk(1)];
                end
        
        [min_tree,min_tree_index]=min(obj_trees);
        if(min_tree<minimum)
            minimum=min_tree;
            bestParams=trees(min_tree_index,:);
        end;
        fprintf('Iter=%d .... min=%g .... FES=%d .... \n',iter,minimum,FEs);
        iterasyonlar(run,iter)=minimum;
        save(iterdosyaadi,'iterasyonlar');
        
    end;
    dosya(run,1)=enkisaobj;
    dosya(run,2)=minimum;
    dosya(run,5)=iter;
    dosya(run,4)=toc;    
    dosya(run,6:D+6)=bestParams;
    fprintf('Run=%d .... min=%g .... time=%g \n',run,minimum,toc);
    [enkisaobjopt2,enkisaopt2] = opt2(data,bestParams);
    dosya(run,3)=enkisaobjopt2;
    fprintf('Run=%d .... 2 opt min=%g .... \n',run,enkisaobjopt2);
    
end
dosya(maxrun+1,1)=mean(dosya(1:maxrun,1));
dosya(maxrun+1,2)=min(dosya(1:maxrun,1));
dosya(maxrun+1,3)=max(dosya(1:maxrun,1));
dosya(maxrun+1,4)=std(dosya(1:maxrun,1));
dosya(maxrun+1,5)=median(dosya(1:maxrun,1));
save(dosyaadi,'dosya');
end
