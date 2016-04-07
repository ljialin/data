%function CalculateWinningRate(fname)

controllers = {'COEV', 'OLMCTS', 'ONESTEP_policy0', 'ONESTEP_policy1', 'ONESTEP_policy10', 'ONESTEP_policy11', 'ONESTEP_policy100', 'ONESTEP_policy110' 'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1'};
GA_controllers = {'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1'};

ME = {'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1', 'OLMCTS', 'COEV'};
namesME = {'$GA-RND_{1x10}$', '$GA-RND_{2x5}$', '$GA-RND_{5x2}$', '$GA-RND_{10x1}$', 'OLMCTS', 'COEV'};

OPP = {'ONESTEP_policy0', 'ONESTEP_policy1', 'ONESTEP_policy10', 'ONESTEP_policy11', 'ONESTEP_policy100', 'ONESTEP_policy110', 'COEV', 'OLMCTS'};
namesOPP= {'$ONESTEP_{MaxAvg}$', '$ONESTEP_{MinAvgOpp}$', '$ONESTEP_{MaxMin}$', '$ONESTEP_{MinMax}$', '$ONESTEP_{MaxAvgFit}$', '$ONESTEP_{MaxMinFit}$', 'COEV', 'OLMCTS'};


disp('\hline');
str='';
for i=1:length(ME)                                                  
    str=sprintf('%s & %s', str, namesME{i});
end
str=sprintf('%s \\\\',str);
disp(str);
disp('\hline');
for j=1:length(OPP)                                                        
    opp=OPP{j};  
    str=sprintf('\\multirow{2}{*}{%s}',namesOPP{j});
    for i=1:length(ME)                                                  
        me=ME{i};  
        %% if I win (column player)
        fname=sprintf('%s_vs_%s_100x1000.wins.p1',me,opp);
        if(exist(fname))
            w=load(fname);
            [n,stdv,meanv]=MyStatistic(w);
            if(n==0)
                str=sprintf('%s & No win',str);
            else
                %me
                str=sprintf('%s & $%.1f\\pm%.1f(%d)$',str,meanv,stdv,n);
            end
        else
            str=sprintf('%s & -',str);
        end
    end
    str=sprintf('%s \\\\',str);
    disp(str);
    str='';
    for i=1:length(ME)                                                        
        me=ME{i};                                               
        fname=sprintf('%s_vs_%s_100x1000.wins.p2',me,opp);                           
        if(exist(fname))
            w=load(fname);
            %% if opp wins (line player)
            [n,stdv,meanv]=MyStatistic(w);
            if(n==0)
                str=sprintf('%s & No win',str);
            else
                %opp
                str=sprintf('%s & $%.1f\\pm%.1f(%d)$',str,meanv,stdv,n);             
            end
        else
            str=sprintf('%s & -',str);
        end

    end
    str=sprintf('%s \\\\',str);
    disp(str);
    disp('\hline');
end

