function [bestParams]=TSPTSA(s,maxrun,maxFEs,N,D,ST,data)
iterdosyaadi=strcat(s,'_nsr_',num2str(ST*10),'_N',num2str(N),'_D',num2str(D),'_',num2str(maxFEs),'_iters');
dosyaadi=strcat(s,'_nsr_',num2str(ST*10),'_N',num2str(N),'_D',num2str(D),'_',num2str(maxFEs));

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
        obj_trees(i)=obj(D,trees(i,:),data);
    end
    FEs = N;
    
    [minimum,min_indis]=min(obj_trees);
    bestParams=trees(min_indis,:);
    
    [maks,maks_indis]=max(obj_trees);
    trees(maks_indis,:)=enkisa;
    obj_trees(maks_indis)=obj(D,trees(maks_indis,:),data);
    
    iter=0;
    
    while(FEs<=maxFEs)
        iter=iter+1;
        for i=1:N
            ns=fix(low+(high-low)*rand)+1;
%             ns=1;
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
                if rand < ST
                    [b1] = op_swap(bestParams(1:D),D);
                    [b1]=[b1 b1(1)];
                    obj_b1=obj(D,b1,data);
                    [b2] = op_shift(bestParams(1:D),D);
                    [b2]=[b2 b2(1)];
                    obj_b2=obj(D,b2,data);
                    [b3] = op_symmetry(bestParams(1:D),D);
                    [b3]=[b3 b3(1)];
                    obj_b3=obj(D,b3,data);
                    
                    [k1] = op_swap(trees(k,1:D),D);
                    [k1]=[k1 k1(1)];
                    obj_k1=obj(D,k1,data);
                    [k2] = op_shift(trees(k,1:D),D);
                    [k2]=[k2 k2(1)];
                    obj_k2=obj(D,k2,data);
                    [k3] = op_symmetry(trees(k,1:D),D);
                    [k3]=[k3 k3(1)];
                    obj_k3=obj(D,k3,data);
                    objler=[obj_b1 obj_b2 obj_b3 obj_k1 obj_k2 obj_k3];
                    tohumlar=[b1 b2 b3 k1 k2 k3];
                    [mint,x]=min(objler);
                    obj_seeds(j)=mint;
                    seeds(j,:)=tohumlar(((x-1)*D)+x:(x*D)+x);
                else
                    [o1] = op_swap(trees(i,1:D),D);
                    [o1]=[o1 o1(1)];
                    obj_o1=obj(D,o1,data);
                    [o2] = op_shift(trees(i,1:D),D);
                    [o2]=[o2 o2(1)];
                    obj_o2=obj(D,o2,data);
                    [o3] = op_symmetry(trees(i,1:D),D);
                    [o3]=[o3 o3(1)];
                    obj_o3=obj(D,o3,data);
                    
                    [k1] = op_swap(trees(k,1:D),D);
                    [k1]=[k1 k1(1)];
                    obj_k1=obj(D,k1,data);
                    [k2] = op_shift(trees(k,1:D),D);
                    [k2]=[k2 k2(1)];
                    obj_k2=obj(D,k2,data);
                    [k3] = op_symmetry(trees(k,1:D),D);
                    [k3]=[k3 k3(1)];
                    obj_k3=obj(D,k3,data);
                    
                    objler=[obj_o1 obj_o2 obj_o3 obj_k1 obj_k2 obj_k3];
                    tohumlar=[o1 o2 o3 k1 k2 k3];
                    [mint,x]=min(objler);
                    obj_seeds(j)=mint;
                    seeds(j,:)=tohumlar(((x-1)*D)+x:(x*D)+x);
                    
                end
                FEs = FEs + 6;               
                
                obj_seeds(j)=obj(D,seeds(j,:),data);                
            end
            
            [mintohum,mintohum_indis]=min(obj_seeds);
            if(mintohum<obj_trees(i))
                trees(i,:)=seeds(mintohum_indis,:);
                obj_trees(i)=mintohum;
            end;
            FEs = FEs + ns;
        end
        
        [min_tree,min_tree_index]=min(obj_trees);
        if(min_tree<minimum)
            minimum=min_tree;
            bestParams=trees(min_tree_index,:);
        end;
        fprintf('Iter=%d .... min=%g .... FES=%d .... \n',iter,minimum,FEs);
        iterasyonlar(run,iter)=minimum;
        save(iterdosyaadi{1},'iterasyonlar');
        
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
dosya(maxrun+1,1)=mean(dosya(1:maxrun,3));
dosya(maxrun+1,2)=min(dosya(1:maxrun,3));
dosya(maxrun+1,3)=max(dosya(1:maxrun,3));
dosya(maxrun+1,4)=std(dosya(1:maxrun,3));
dosya(maxrun+1,5)=median(dosya(1:maxrun,3));
save(dosyaadi{1},'dosya');
end
