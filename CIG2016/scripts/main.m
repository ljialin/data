%function CalculateWinningRate(fname)

controllers = {'COEV', 'OLMCTS', 'ONESTEP_policy0', 'ONESTEP_policy1', 'ONESTEP_policy10', 'ONESTEP_policy11', 'ONESTEP_policy100', 'ONESTEP_policy110' 'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1'};
GA_controllers = {'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1'};

ME = {'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1', 'COEV', 'OLMCTS'};
OPP = {'ONESTEP_policy0', 'ONESTEP_policy1', 'ONESTEP_policy10', 'ONESTEP_policy11', 'ONESTEP_policy100', 'ONESTEP_policy110', 'OLMCTS', 'COEV'};

namesOPP= {'$ONESTEP_{MaxAvg}$', '$ONESTEP_{MinAvgOpp}$', '$ONESTEP_{MaxMin}$', '$ONESTEP_{MinMax}$', '$ONESTEP_{MaxAvgFit}$', '$ONESTEP_{MaxMinFit}$', 'COEV', 'OLMCTS'};
namesME = {'$GA-RND_{1x10}$', '$GA-RND_{2x5}$', '$GA-RND_{5x2}$', '$GA-RND_{10x1}$', 'OLMCTS', 'COEV'};

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
        fname=sprintf('%s_vs_%s_100x200.txt',me,opp);
        if(exist(fname))
        [n1,stdv1,meanv1,n2,stdv2,meanv2]=CalculateWinningRate(fname);
        if(n1==0)
            str=sprintf('%s & No win',str);
        else
            %me
            str=sprintf('%s & $%.1f\\pm%.1f(%d)$',str,meanv2,stdv2,n2);
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
        fname=sprintf('%s_vs_%s_100x200.txt',me,opp);                           
        if(exist(fname))
        [n1,stdv1,meanv1,n2,stdv2,meanv2]=CalculateWinningRate(fname);          
        if(n2==0)
            str=sprintf('%s & No win',str);
        else
            %opp
            str=sprintf('%s & $%.1f\\pm%.1f(%d)$',str,meanv1,stdv1,n1);             
        end
        else
            str=sprintf('%s & -',str);
        end

    end
    str=sprintf('%s \\\\',str);
    disp(str);
    disp('\hline');
end

