%function CalculateWinningRate(fname)

controllers = {'COEV', 'OLMCTS', 'ONESTEP_policy0', 'ONESTEP_policy1', 'ONESTEP_policy10', 'ONESTEP_policy11', 'ONESTEP_policy100', 'ONESTEP_policy110' 'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1'};
GA_controllers = {'GA-RND_1x10', 'GA-RND_2x5', 'GA-RND_5x2', 'GA-RND_10x1'};
OPPs = {'COEV', 'OLMCTS', 'ONESTEP_policy0', 'ONESTEP_policy1', 'ONESTEP_policy10', 'ONESTEP_policy11', 'ONESTEP_policy100', 'ONESTEP_policy110'};

names = {'COEV', 'OLMCTS', '$ONESTEP_{MaxAvg}$', '$ONESTEP_{MinAvgOpp}$', '$ONESTEP_{MaxMin}$', '$ONESTEP_{MinMax}$', '$ONESTEP_{MaxAvgFit}$', '$ONESTEP_{MaxMinFit}$'};
namesH = {'$GA-RND_{1x10}$', '$GA-RND_{2x5}$', '$GA-RND_{5x2}$', '$GA-RND_{10x1}$'};

disp('\hline');
str='';
for i=1:length(GA_controllers)                                                  
    str=sprintf('%s & %s', str, namesH{i});
end
str=sprintf('%s \\\\',str);
disp(str);
disp('\hline');
for j=1:length(OPPs)                                                        
    opp=OPPs{j};  
    str=sprintf('\\multirow{2}{*}{%s}',names{j});
    for i=1:length(GA_controllers)                                                  
        me=GA_controllers{i};  
        fname=sprintf('%s_vs_%s_100x100.txt',me,opp);
        [n1,stdv1,meanv1,n2,stdv2,meanv2]=CalculateWinningRate(fname);
        if(n1==0)
            str=sprintf('%s & No win',str);
        else
            str=sprintf('%s & $%.1f\\pm%.1f(%d)$',str,meanv1,stdv1,n1);
        end
    end
    str=sprintf('%s \\\\',str);
    disp(str);
    str='';
    for j=1:length(GA_controllers)                                                        
        me=GA_controllers{i};                                               
        fname=sprintf('%s_vs_%s_100x100.txt',me,opp);                           
        [n1,stdv1,meanv1,n2,stdv2,meanv2]=CalculateWinningRate(fname);          
        if(n2==0)
            str=sprintf('%s & No win',str);
        else
            str=sprintf('%s & $%.1f\\pm%.1f(%d)$',str,meanv2,stdv2,n2);             
        end
    end
    str=sprintf('%s \\\\',str);
    disp(str);
    disp('\hline');
end

